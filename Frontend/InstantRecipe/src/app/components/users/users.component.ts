import { Component } from '@angular/core';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrl: './users.component.css'
})
export class UsersComponent {
  users: any[] = [];

  constructor(private auth: AuthService) { 
    this.loadUsers()
  }

  

  loadUsers() {
    this.auth.getUsers().subscribe(
      (users) => {
        console.log(users.data);
        this.users = users.data
      },
      (error) => {
        console.log(error);
      }
    )
  }

  toggleAdmin(user: any) {
    if (user.admin === 1) {
      this.removeAdmin(user);
    } else {
      this.setAdmin(user);
    }
  }

  setAdmin(user: any) {
    this.auth.setAdmin(user).subscribe(
      (response) => {
        console.log(response);
        this.loadUsers()
      },
      (error) => {
        console.log(error);
      }
    )
  }

  removeAdmin(user: any) {
    this.auth.removeAdmin(user).subscribe(
      (response) => {
        console.log(response);
        this.loadUsers()
      },
      (error) => {
        console.log(error);
      }
    )
  }
}
