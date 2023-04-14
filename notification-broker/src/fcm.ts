import admin, { ServiceAccount } from "firebase-admin"

import serviceAccount from "./campusme-699f8-firebase-adminsdk-s4f4h-d24f0d045f.json"

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount as ServiceAccount),
})

export default admin
