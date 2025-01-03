import asyncio
import sys
from bleak import BleakScanner
from loguru import logger

# logger = logging.getLogger("auto-connect")
# logger.setLevel(logging.DEBUG)
# handler = logging.StreamHandler(sys.stdout)
# logger.addHandler(handler)

async def scan_and_show_devices(rssi_lower_limit: int = -60):
        logger.debug("scanning...")
        devices = await BleakScanner.discover(timeout=2.0)
        # devices = await BleakScanner.discovered_devices_and_advertisement_data(timeout=1.0)
        for d in [_d for _d in devices if _d.rssi > rssi_lower_limit]:
           logger.debug(f"Device: {d.name}, Address: {d.address}, RSSI: {d.rssi}")


async def main():
    await scan_and_show_devices()

asyncio.run(main())
