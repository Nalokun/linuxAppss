npm init -y

npm i @paralleldrive/cuid2 @sendgrid/mail @types/cors bcrypt cookie-parser cors dotenv drizzle-orm express express-rate-limit google-auth-library helmet jsonwebtoken passport passport-google-oauth20 pg reflect-metadata swagger-jsdoc swagger-ui-express validator winston
npm i -D @babel/core @babel/preset-env @eslint/compat @eslint/eslintrc @eslint/js @faker-js/faker @types/bcrypt @types/cookie-parser @types/express @types/jest @types/jsonwebtoken @types/node @types/passport @types/passport-google-oauth20 @types/pg @types/supertest @types/swagger-jsdoc @types/swagger-ui-express @types/validator @typescript-eslint/eslint-plugin @typescript-eslint/parser babel-cli babel-jest babel-preset-env drizzle-kit eslint eslint-config-prettier globals husky jest openapi-typescript prettier superagent supertest ts-jest ts-node ts-node-dev type-coverage typescript typescript-eslint
#!/bin/bash

PROJECT_NAME="my-drizzle-api"

echo "🚀 Creating project: $PROJECT_NAME"

# إنشاء المجلد
mkdir $PROJECT_NAME
cd $PROJECT_NAME

# تهيئة npm
npm init -y

# تثبيت الحزم الأساسية
npm install express pg dotenv
npm install drizzle-orm
npm install -D typescript ts-node-dev @types/node @types/express

# إعداد TypeScript
npx tsc --init

# إنشاء هيكل المشروع
mkdir -p src/db/schema
mkdir -p src/db
mkdir -p src/config
mkdir -p src/routes
mkdir -p src/controllers
mkdir -p src/services
mkdir -p src/middleware
mkdir -p src/utils

# إنشاء الملفات الأساسية
touch src/server.ts
touch src/app.ts
touch src/db/index.ts
touch src/db/schema/users.ts
touch src/config/index.ts
touch .env
touch .gitignore

# إعداد .gitignore
cat <<EOL > .gitignore
node_modules
dist
.env
EOL

# إعداد .env افتراضي
cat <<EOL > .env
PORT=3000
DATABASE_URL=postgresql://postgres:1234@localhost:5432/mydb
EOL

# إعداد script تشغيل
node <<EOF > package.json.tmp
const fs = require('fs');
const pkg = require('./package.json');

pkg.scripts = {
  dev: "ts-node-dev --respawn --transpile-only src/server.ts",
  build: "tsc",
  start: "node dist/server.js"
};

fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2));
EOF

node package.json.tmp
rm package.json.tmp

# إعداد Express server بسيط
cat <<EOL > src/app.ts
import express from 'express';

const app = express();
app.use(express.json());

export default app;
EOL

cat <<EOL > src/server.ts
import app from './app';
import dotenv from 'dotenv';

dotenv.config();

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(\`Server running on port \${PORT}\`);
});
EOL

# إعداد Drizzle connection
cat <<EOL > src/db/index.ts
import { drizzle } from 'drizzle-orm/node-postgres';
import { Pool } from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

export const db = drizzle(pool);
EOL

# إنشاء نموذج جدول users بسيط
cat <<EOL > src/db/schema/users.ts
import { pgTable, text, timestamp } from 'drizzle-orm/pg-core';

export const users = pgTable('users', {
  id: text('id').primaryKey(),
  email: text('email').notNull().unique(),
  password: text('password').notNull(),
  createdAt: timestamp('created_at').defaultNow(),
});
EOL

echo "✅ Project created successfully!"
echo "👉 cd $PROJECT_NAME"
echo "👉 npm run dev"