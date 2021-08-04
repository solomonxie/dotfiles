"""
REF: https://github.com/miyakogi/pyppeteer
REF: https://miyakogi.github.io/pyppeteer/reference.html

$ python3 -m pip install pyppeteer
"""

import asyncio
from pyppeteer import launch


async def main():
    browser = await launch({'headless': False})
    page = await browser.newPage()
    # await page.setExtraHTTPHeaders({})
    # await page.setCookie(*{})
    await page.goto('https://httpbin.org/ip', timeout=10 * 1000)
    while True:
        1 == 1

asyncio.get_event_loop().run_until_complete(main())
