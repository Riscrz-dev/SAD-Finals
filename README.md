# WHOOW SABAW — Marathon Branch

A responsive 24/7 food-ordering and admin-management web app prototype for the WHOOW SABAW Marathon Branch.

## Stack
- React + Vite
- Plain CSS with responsive layouts
- Browser localStorage for demo persistence
- Ready for Supabase and Vercel configuration

## Run locally
```bash
npm install
npm run dev
```

## Current functionality
- Browse Filipino meals and filter by category
- Add items to cart and adjust quantities
- Place demo orders
- Admin preview for menu availability and order status management
- Demo data persists in the current browser via localStorage

> Important: this initial version is a functional frontend demo. Orders and menu changes are stored in the current browser only; they are not yet shared across devices. Production deployment requires Supabase project credentials, database setup, and authenticated admin access. Do not use real customer data until those are configured.

## Deployment
Import this repository into Vercel and use the default Vite settings:
- Build command: `npm run build`
- Output directory: `dist`

See `.env.example` and `supabase/schema.sql` for the planned backend setup.