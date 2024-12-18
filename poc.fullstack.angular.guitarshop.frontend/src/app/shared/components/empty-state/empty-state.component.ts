import { Component, input, output } from '@angular/core';
import { MatButton } from '@angular/material/button';
import { MatIcon } from '@angular/material/icon';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-empty-state',
  imports: [
    MatIcon,
    MatButton,
    RouterLink
  ],
  templateUrl: './empty-state.component.html',
  styleUrl: './empty-state.component.scss'
})

export class EmptyStateComponent {
  public message = input.required<string>();
  public icon = input.required<string>();
  public actionText = input.required<string>();
  public action = output<void>();

  public onAction() {
    this.action.emit();
  }
}
