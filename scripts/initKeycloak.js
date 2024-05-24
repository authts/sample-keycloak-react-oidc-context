import KcAdminClient from '@keycloak/keycloak-admin-client';
import { readFileSync } from 'fs';

const rawData = readFileSync('./scripts/config/realm-export.json');
const realmExport = JSON.parse(rawData);

const users = [
  {
    username: 'bruce@example.com',
    password: 'juggle-prance-shallot-wireless-outlet',
    firstName: 'Bruce',
    lastName: 'Wayne'
  },
  {
    username: 'betty@example.com',
    password: 'juggle-prance-shallot-wireless-outlet',
    firstName: 'Betty',
    lastName: 'Jane'
  }
]

async function initKeycloak() {
  const kc = new KcAdminClient({
    baseUrl: 'http://kc:8080',
    realmName: 'master'
  })

  await kc.auth({
    username: 'admin',
    password: 'admin',
    grantType: 'password',
    clientId: 'admin-cli',  })

  await kc.realms.del({ realm: realmExport.realm }).catch((err) => {
    if (err.response.status !== 404) {
      throw err
    }
  })

  await kc.realms.create(realmExport)

  kc.setConfig({
    realmName: realmExport.realm,
  })

  for (let user of users) {
    console.log(`creating user ${user.username} with password ${user.password}`)
    await kc.users.create({
      realm: realmExport.realm,
      username: user.username,
      email: user.username,
      firstName: user.firstName,
      lastName: user.lastName,
      enabled: true,
      credentials: [
        {
          type: 'password',
          value: user.password,
          temporary: false
        }
      ]
    })
  }
}

initKeycloak().catch(console.log).then(() => console.log('done'))