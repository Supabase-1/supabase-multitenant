# اختيار بيئة تشغيل نود
FROM node:18-alpine

# تحديد مجلد العمل داخل الحاوية
WORKDIR /app

# نسخ ملفات الاعتماديات وتثبيتها
COPY package*.json ./
RUN npm install

# نسخ بقية ملفات المشروع
COPY . .

# بناء المشروع إذا كان يعتمد على Next.js / TypeScript
RUN npm run build --if-present

# تحديد المنفذ وتشغيل التطبيق
EXPOSE 3000
CMD ["npm", "start"]

