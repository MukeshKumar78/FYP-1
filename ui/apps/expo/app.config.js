module.exports = {
  name: "CampusMe",
  slug: "campus-me",
  icon: "./assets/icon.png",
  version: '1.0.0',
  extra: {
    fact: 'kittens are cool',
    eas: {
      projectId: "93228eb7-5f89-49a2-adad-07cbb58ef925"
    }
  },
  scheme: "campusme",
  android: {
    package: "com.campusme.app",
    icon: "./assets/icon.png",
    googleServicesFile: "./google-services.json",
    useNextNotificationsApi: true,
    compileSdkVersion: 31,
    targetSdkVersion: 31,
    buildToolsVersion: "31.0.0"
  }
};
