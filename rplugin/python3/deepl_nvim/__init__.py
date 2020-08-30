# -*- coding: utf-8 -*-
from importlib.util import find_spec
if find_spec('pynvim'):
    import pynvim as vim
else:
    import neovim as vim
import requests

@vim.plugin
class DeeplNvim(object):
    def __init__(self, nvim):
        self.nvim = nvim

    @vim.function('_deepl_init', sync=True)
    def _deepl_init(self, args):
        self.key = self.nvim.eval('g:deepl#api_key')
        pass

    @vim.function('_deepl_get_translated_text', sync=True)
    def _get_translated_text(self, args) -> str:
        params = {
            "auth_key": self.key,
            "source_lang": args[0],
            "target_lang": args[1],
            "text": args[2],
            "split_sentences": "nonewlines"
        }
        request = requests.post("https://api.deepl.com/v2/translate", data=params)
        result = request.json()
        return result["translations"][0]["text"]
