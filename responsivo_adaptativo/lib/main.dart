import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto Financiero',

      //  TEMA CLARO
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),

      //  TEMA OSCURO
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),

      //  Tema adaptativo según la configuración del sistema
      themeMode: ThemeMode.system, // dark / light / system

      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomAppBar(),
              SizedBox(height: 30),
              BalanceCard(),
              SizedBox(height: 35),
              QuickActions(),
              SizedBox(height: 35),
              TransactionsList(),
            ],
          ),
        ),
      ),
    );
  }
}

//------------------------------------------------------------
/// 1. APP BAR
//  ------------------------------------------------------------

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Bienvenido, Usuario 👋",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: colors.primary,
          ),
        ),
        CircleAvatar(
          radius: 26,
          backgroundColor: colors.primary,
          child: Icon(Icons.person, color: colors.onPrimary),
        ),
      ],
    );
  }
}

//------------------------------------------------------------>
/// 2️. BALANCE CARD
//------------------------------------------------------------

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [colors.primary, colors.primaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Balance Disponible",
              style: TextStyle(
                color: colors.onPrimary.withOpacity(0.8),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "S/ 800.00",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: colors.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//------------------------------------------------------------
/// 3️. QUICK ACTIONS
//------------------------------------------------------------

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 30,
      runSpacing: 25,
      children: [
        ActionButton(icon: Icons.send, label: "Transferir"),
        ActionButton(icon: Icons.payment, label: "Servicios"),
        ActionButton(icon: Icons.savings, label: "Ahorro"),
        ActionButton(icon: Icons.analytics, label: "Estadísticas"),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const ActionButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: colors.surface,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 28, color: colors.primary),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: colors.onSurface,
          ),
        ),
      ],
    );
  }
}

//------------------------------------------------------------>
/// 4. TRANSACTIONS
//-------------------------------------------------------------

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TransactionItem(
          icon: Icons.shopping_bag,
          title: "Compra Online",
          date: "20 Feb",
          amount: "- S/ 200",
          isExpense: true,
        ),
        SizedBox(height: 15),
        TransactionItem(
          icon: Icons.work,
          title: "Pago Freelance",
          date: "19 Feb",
          amount: "+ S/ 1800",
          isExpense: false,
        ),
      ],
    );
  }
}

class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String amount;
  final bool isExpense;

  const TransactionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    required this.isExpense,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: colors.primary),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: colors.onSurface,
                    ),
                  ),
                  Text(date, style: TextStyle(color: colors.onSurfaceVariant)),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isExpense ? colors.error : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
