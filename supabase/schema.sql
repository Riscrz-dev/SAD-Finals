-- Run in the Supabase SQL editor after creating a project.
create extension if not exists pgcrypto;

create table if not exists public.menu_items (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  description text not null default '',
  category text not null default 'Meals',
  price numeric(10,2) not null check (price >= 0),
  image_url text,
  available boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists public.orders (
  id uuid primary key default gen_random_uuid(),
  customer_name text not null,
  contact_number text not null,
  fulfillment text not null check (fulfillment in ('Pickup','Delivery')),
  address text,
  notes text,
  status text not null default 'Received' check (status in ('Received','Preparing','Ready','Completed','Cancelled')),
  total numeric(10,2) not null check (total >= 0),
  created_at timestamptz not null default now()
);

create table if not exists public.order_items (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.orders(id) on delete cascade,
  menu_item_id uuid references public.menu_items(id) on delete set null,
  item_name text not null,
  quantity integer not null check (quantity > 0),
  unit_price numeric(10,2) not null check (unit_price >= 0)
);

alter table public.menu_items enable row level security;
alter table public.orders enable row level security;
alter table public.order_items enable row level security;

-- Public visitors can read available dishes. Admin write policies should be
-- added only after Supabase Auth and an admin-role strategy are configured.
create policy "Anyone can view available menu items"
on public.menu_items for select using (available = true);

-- Do not enable public order insertion or admin writes until production
-- validation, rate limiting, and authenticated role policies are configured.