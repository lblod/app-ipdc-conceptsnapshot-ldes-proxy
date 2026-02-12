# app-ipdc-conceptsnapshot-ldes-proxy
Semantic.works application proxying to an IPDC conceptsnapshot LDES feed.

## Configuration
When deploying this application, make sure to fill in the `API_URL` environment variable of the `proxy` service.

## Why is this proxy needed?
There are a few issues regarding the `Cache-Control` headers of the IPDC LDES feeds causing ldes-clients to constantly refetch all pages of the LDES feed. This causes a great load on the system consuming the LDES feed.
This proxy application corrects the `Cache-Control` headers of the IPDC LDES feed responses.

Additionally, this proxy service also removes relations pointing to a previous page in the LDES feed, as experience tells that LDES clients are not always able to handle this very well. Additionally, this relationship is not strictly needed.

This is an alternative to https://github.com/lblod/app-ipdc-ldes-mirror.