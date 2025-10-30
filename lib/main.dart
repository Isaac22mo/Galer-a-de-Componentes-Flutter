import 'package:flutter/material.dart';

// Importaciones de los 8 Componentes Personalizados (Asegúrate de que las rutas sean correctas)
// Estos enums y clases deben estar definidos en sus respectivos archivos Dart.
import 'widgets/custom_button.dart';
import 'widgets/custom_card.dart';
import 'widgets/custom_alert.dart';
import 'widgets/custom_avatar.dart';
import 'widgets/custom_badge.dart';
import 'widgets/custom_chip.dart';
import 'widgets/custom_input.dart';
import 'widgets/custom_progress.dart';

void main() {
  runApp(const ComponentGalleryApp());
}

class ComponentGalleryApp extends StatelessWidget {
  const ComponentGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galería de Componentes',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const ComponentGalleryScreen(),
    );
  }
}

class ComponentGalleryScreen extends StatelessWidget {
  const ComponentGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galería de Componentes'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Botones
            _buildComponentSection(
              context,
              icon: const Icon(Icons.touch_app, color: Colors.blue),
              title: '1. CustomButton',
              description:
                  'Botones con estilos primario, secundario y delineado.',
              content: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    text: 'Primary',
                    onPressed: null,
                    variant: CustomButtonVariant.primary,
                  ),
                  CustomButton(
                    text: 'Secondary',
                    onPressed: null,
                    variant: CustomButtonVariant.secondary,
                  ),
                  CustomButton(
                    text: 'Outlined',
                    onPressed: null,
                    variant: CustomButtonVariant.outlined,
                  ),
                ],
              ),
            ),
            const Divider(),

            // 2. Tarjetas
            _buildComponentSection(
              context,
              icon: const Icon(Icons.layers, color: Colors.green),
              title: '2. CustomCard',
              description: 'Contenedores con elevación, borde o fondo sólido.',
              content: Column(
                children: [
                  CustomCard(
                    variant: CustomCardVariant.elevated,
                    child: const Text('Elevated Card (Sombra)'),
                  ),
                  const SizedBox(height: 10),
                  CustomCard(
                    variant: CustomCardVariant.outlined,
                    child: const Text('Outlined Card (Borde)'),
                  ),
                  const SizedBox(height: 10),
                  CustomCard(
                    variant: CustomCardVariant.filled,
                    color: Colors.blue,
                    child: const Text(
                      'Filled Card (Color de fondo)',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),

            // 3. Avatares
            _buildComponentSection(
              context,
              icon: const Icon(Icons.person, color: Colors.purple),
              title: '3. CustomAvatar',
              description:
                  'Avatares con formas circular, redondeada y cuadrada.',
              content: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomAvatar(
                    initials: 'AB',
                    variant: CustomAvatarVariant.circular,
                  ),
                  CustomAvatar(
                    initials: 'CD',
                    variant: CustomAvatarVariant.rounded,
                    backgroundColor: Colors.orange,
                  ),
                  CustomAvatar(
                    initials: 'EF',
                    variant: CustomAvatarVariant.square,
                    size: 60.0,
                  ),
                ],
              ),
            ),
            const Divider(),

            // 4. Badges
            _buildComponentSection(
              context,
              icon: const Icon(Icons.label, color: Colors.red),
              title: '4. CustomBadge',
              description:
                  'Etiquetas pequeñas de estado (Info, Success, Warning, Error).',
              content: const Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: [
                  CustomBadge(text: 'Info', variant: StatusVariant.info),
                  CustomBadge(text: 'Success', variant: StatusVariant.success),
                  CustomBadge(text: 'Warning', variant: StatusVariant.warning),
                  CustomBadge(text: 'Error', variant: StatusVariant.error),
                ],
              ),
            ),
            const Divider(),

            // 5. Chips
            _buildComponentSection(
              context,
              icon: const Icon(Icons.loyalty, color: Colors.amber),
              title: '5. CustomChip',
              description:
                  'Chips para selección con estilos estándar, delineado y coloreado.',
              content: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: [
                  const CustomChip(
                    label: 'Default Chip',
                    variant: CustomChipVariant.standard,
                  ),
                  CustomChip(
                    label: 'Selected Chip',
                    variant: CustomChipVariant.outlined,
                    selected: true,
                    onDeleted: () {},
                  ),
                  const CustomChip(
                    label: 'Colored Chip',
                    variant: CustomChipVariant.colored,
                  ),
                ],
              ),
            ),
            const Divider(),

            // 6. Alertas
            _buildComponentSection(
              context,
              icon: const Icon(Icons.notifications_active, color: Colors.teal),
              title: '6. CustomAlert',
              description:
                  'Mensajes informativos con fondo suave y color según el estado.',
              content: Column(
                children: [
                  const CustomAlert(
                    message: 'Información importante aquí.',
                    variant: StatusVariant.info,
                  ),
                  const SizedBox(height: 8),
                  CustomAlert(
                    message: 'Operación completada con éxito.',
                    variant: StatusVariant.success,
                    onClose: () {},
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const Divider(),

            // 7. Input
            _buildComponentSection(
              context,
              icon: const Icon(Icons.edit, color: Colors.indigo),
              title: '7. CustomInput',
              description:
                  'Campos de texto con estilos estándar, delineado y relleno.',
              content: Column(
                children: [
                  const CustomInput(
                    hintText: 'Standard Input',
                    variant: CustomInputVariant.standard,
                    prefixIcon: Icons.code,
                  ),
                  const SizedBox(height: 16),
                  const CustomInput(
                    hintText: 'Outlined Input',
                    variant: CustomInputVariant.outlined,
                  ),
                  const SizedBox(height: 16),
                  const CustomInput(
                    hintText: 'Filled Input',
                    variant: CustomInputVariant.filled,
                    obscureText: true,
                  ),
                ],
              ),
            ),
            const Divider(),

            // 8. Progreso
            _buildComponentSection(
              context,
              icon: const Icon(Icons.hourglass_empty, color: Colors.brown),
              title: '8. CustomProgress',
              description:
                  'Indicadores de progreso lineal, circular y personalizado.',
              content: Column(
                children: [
                  const Text('Linear (Determinado):'),
                  const SizedBox(height: 8),
                  const CustomProgress(
                    value: 0.75,
                    variant: CustomProgressVariant.linear,
                  ),
                  const SizedBox(height: 16),
                  const Text('Circular (Indeterminado):'),
                  const SizedBox(height: 8),
                  const CustomProgress(
                    value: null,
                    variant: CustomProgressVariant.circular,
                  ),
                  const SizedBox(height: 16),
                  const Text('Custom (70%):'),
                  const SizedBox(height: 8),
                  CustomProgress(
                    value: 0.70,
                    variant: CustomProgressVariant.custom,
                    size: 30.0,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Widget de ayuda para construir cada sección de componente
  Widget _buildComponentSection(
    BuildContext context, {
    required Icon icon,
    required String title,
    required String description,
    required Widget content,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon,
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(description, style: TextStyle(color: Colors.grey.shade600)),
          const SizedBox(height: 12),
          // Contenedor para agrupar visualmente el componente
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: content,
          ),
        ],
      ),
    );
  }
}
