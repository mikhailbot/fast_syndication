use atom_syndication::Feed;
use rustler::{Encoder, Env, NifResult, Term};
use serde_json::json;

mod atoms {
    rustler::atoms! {
        ok,
        error
    }
}

rustler::init!("Elixir.FastSyndication.Native", [parse_atom, parse_rss]);

#[rustler::nif(schedule = "DirtyCpu")]
fn parse_atom(env: Env, atom_string: String) -> NifResult<Term> {
    let channel = atom_string
        .parse::<Feed>()
        .map_err(|err| format!("Unable to parse RSS - ({:?})", err));

    let ser = serde_rustler::Serializer::from(env);
    let de = json!(channel);

    let encoded =
        serde_transcode::transcode(de, ser).map_err(|_err| "Unable to encode to erlang terms");

    match encoded {
        Ok(term) => Ok(term),
        Err(error_message) => Ok((atoms::error(), error_message).encode(env)),
    }
}

#[rustler::nif(schedule = "DirtyCpu")]
fn parse_rss(env: Env, rss_string: String) -> NifResult<Term> {
    let channel = rss::Channel::read_from(rss_string.as_bytes())
        .map_err(|err| format!("Unable to parse RSS - ({:?})", err));

    let ser = serde_rustler::Serializer::from(env);
    let de = json!(channel);

    let encoded =
        serde_transcode::transcode(de, ser).map_err(|_err| "Unable to encode to erlang terms");

    match encoded {
        Ok(term) => Ok(term),
        Err(error_message) => Ok((atoms::error(), error_message).encode(env)),
    }
}
