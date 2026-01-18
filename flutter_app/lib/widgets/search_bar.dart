import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Search bar widget matching the React SearchBar component.
class SearchBar extends StatefulWidget {
  final String placeholder;
  final String value;
  final ValueChanged<String>? onChange;

  const SearchBar({
    super.key,
    this.placeholder = 'Search courses...',
    this.value = '',
    this.onChange,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(SearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value && _controller.text != widget.value) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _isFocused ? 1.02 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isFocused ? AppColors.primary : AppColors.border,
            width: _isFocused ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Icon(
                Icons.search,
                size: 20,
                color: _isFocused ? AppColors.primary : AppColors.muted,
              ),
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                onChanged: widget.onChange,
                onTap: () => setState(() => _isFocused = true),
                onEditingComplete: () {
                  setState(() => _isFocused = false);
                  FocusScope.of(context).unfocus();
                },
                onTapOutside: (_) {
                  setState(() => _isFocused = false);
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  hintText: widget.placeholder,
                  hintStyle: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                ),
                style: const TextStyle(
                  color: AppColors.foreground,
                  fontSize: 16,
                ),
              ),
            ),
            if (_controller.text.isNotEmpty)
              GestureDetector(
                onTap: () {
                  _controller.clear();
                  widget.onChange?.call('');
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.close,
                    size: 20,
                    color: AppColors.muted,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
