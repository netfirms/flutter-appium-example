const wdio = require('webdriverio');
const assert = require('assert');
const find = require('appium-flutter-finder');

const opts = {
  port: 4723,
  capabilities: {
    //...osSpecificOps,
      platformName: 'Android',
      deviceName: 'emulator-5554',
      automationName: 'Flutter',
      app: __dirname + '/../build/app/outputs/apk/debug/app-debug.apk'

  }
};

(async () => {
  console.log('Initial app testing')
  const driver = await wdio.remote(opts);
   assert.strictEqual(await driver.execute('flutter:checkHealth'), 'ok');
  await driver.execute('flutter:clearTimeline');
  await driver.execute('flutter:forceGC');

  //Enter login page
  await driver.execute('flutter:waitFor', find.byValueKey('loginBtn'));
  await driver.elementSendKeys(find.byValueKey('emailTxt'), 'test@gmail.com')
  await driver.elementSendKeys(find.byValueKey('passwordTxt'), '123456')
  await driver.elementClick(find.byValueKey('loginBtn'));

  //Enter home page
  await driver.execute('flutter:waitFor', find.byValueKey('homeGreetingLbl'));
  assert.strictEqual(await driver.getElementText(find.byValueKey('homeGreetingLbl')), 'Welcome to Home Page');

  //Enter Page1
  await driver.elementClick(find.byValueKey('page1Btn'));
  await driver.execute('flutter:waitFor', find.byValueKey('page1GreetingLbl'));
  assert.strictEqual(await driver.getElementText(find.byValueKey('page1GreetingLbl')), 'Page1');
  await driver.elementClick(find.byValueKey('page1BackBtn'));

  //Enter Page2
  await driver.elementClick(find.byValueKey('page2Btn'));
  await driver.execute('flutter:waitFor', find.byValueKey('page2GreetingLbl'));
  assert.strictEqual(await driver.getElementText(find.byValueKey('page2GreetingLbl')), 'Page2');
  await driver.switchContext('NATIVE_APP');
  await driver.back();
  await driver.switchContext('FLUTTER');

  //Logout application
  await driver.elementClick(find.byValueKey('logoutBtn'));
  driver.deleteSession();
})();