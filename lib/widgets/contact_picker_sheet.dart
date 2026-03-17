import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

/// A bottom-sheet contact picker with a live search field.
///
/// Shows all [contacts] sorted alphabetically. As the user types, the list is
/// filtered to contacts whose name **starts with** the query first, followed
/// by those that **contain** it — giving a natural "closest match on top" feel.
///
/// Usage:
/// ```dart
/// final contact = await showModalBottomSheet<Contact?>(
///   context: context,
///   isScrollControlled: true,
///   builder: (_) => ContactPickerSheet(contacts: contactsWithPhones),
/// );
/// ```
class ContactPickerSheet extends StatefulWidget {
  const ContactPickerSheet({super.key, required this.contacts});

  final List<Contact> contacts;

  @override
  State<ContactPickerSheet> createState() => _ContactPickerSheetState();
}

class _ContactPickerSheetState extends State<ContactPickerSheet> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Contact> get _filtered {
    if (_query.isEmpty) return widget.contacts;
    final lower = _query.toLowerCase();
    // Contacts whose name starts with the query rank above those that only contain it.
    final starts = <Contact>[];
    final contains = <Contact>[];
    for (final c in widget.contacts) {
      final name = (c.displayName ?? '').toLowerCase();
      if (name.startsWith(lower)) {
        starts.add(c);
      } else if (name.contains(lower)) {
        contains.add(c);
      }
    }
    return [...starts, ...contains];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filtered = _filtered;
    // Fill up to 70% of the screen height so the keyboard doesn't push content away.
    final maxHeight = MediaQuery.of(context).size.height * 0.7;

    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Drag handle
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 4),
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: Text(
                'Select a contact',
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            // Search field
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
              child: TextField(
                controller: _searchController,
                autofocus: true,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Search by name…',
                  prefixIcon: const Icon(Icons.search, size: 20),
                  suffixIcon: _query.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, size: 20),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _query = '');
                          },
                        )
                      : null,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  isDense: true,
                ),
                onChanged: (v) => setState(() => _query = v.trim()),
              ),
            ),
            const Divider(height: 1),
            // Results list
            Flexible(
              child: filtered.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(32),
                      child: Text(
                        'No contacts match "$_query"',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: filtered.length,
                      itemBuilder: (ctx, index) {
                        final c = filtered[index];
                        final number =
                            c.phones.isNotEmpty ? c.phones.first.number : '';
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                theme.colorScheme.primaryContainer,
                            foregroundColor:
                                theme.colorScheme.onPrimaryContainer,
                            child: Text(
                              (c.displayName?.characters.firstOrNull
                                      ?.toUpperCase()) ??
                                  '?',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          title: _HighlightedText(
                            text: c.displayName ?? '',
                            query: _query,
                          ),
                          subtitle: Text(number),
                          onTap: () => Navigator.of(ctx).pop(c),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Renders [text] with [query] highlighted in bold.
class _HighlightedText extends StatelessWidget {
  const _HighlightedText({required this.text, required this.query});

  final String text;
  final String query;

  @override
  Widget build(BuildContext context) {
    if (query.isEmpty) return Text(text);

    final lower = text.toLowerCase();
    final matchStart = lower.indexOf(query.toLowerCase());
    if (matchStart < 0) return Text(text);

    final matchEnd = matchStart + query.length;
    return Text.rich(
      TextSpan(children: [
        if (matchStart > 0) TextSpan(text: text.substring(0, matchStart)),
        TextSpan(
          text: text.substring(matchStart, matchEnd),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        if (matchEnd < text.length) TextSpan(text: text.substring(matchEnd)),
      ]),
    );
  }
}
