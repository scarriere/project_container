print('Start #################################################################');

db = db.getSiblingDB('ginkgo')

db.createUser({
  user: 'service',
  pwd: 'service',
  roles: [{ role: 'readWrite', db: 'ginkgo' }],
});
db.createCollection('users')

print('END #################################################################');