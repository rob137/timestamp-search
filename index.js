import puppeteer from 'puppeteer';

function convertTimeStamp(timestamp) {
  const video = document.getElementsByTagName('video')[0];
  if (timestamp) {
    const [hours, minutes, seconds] = timestamp.split(':').map(s => Number(s));
    const conversion = hours * 3600 + minutes * 60 + seconds;
    video.currentTime += conversion;
  }
}

async function closeFirstTab(browser) {
  const pages = await browser.pages();
  await pages[0].close();
};

async function main() {
  const browser = await puppeteer.launch({
    headless: false,
    executablePath: '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
    defaultViewport: null,
  });
  const page = await browser.newPage('');
  await page.goto('file:///Users/robert.kirby/central-intro-video/video.mp4');
  closeFirstTab(browser);

  await page.evaluate(convertTimeStamp, process.argv[2]);
}

main();

