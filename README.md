# nasdaily_challenge

Flutter project for this challenge

## State management

For state management I use setState because this project only have one page and I can't use a package. Due the time I didn't separate business logic of UI, the right way (without package) is creating a separate file for logic, initialize stream, from UI send events and receive snapshots in order to update our View.

## Animation

I use AnimatedList in order to improve user experience adding a customer.

## TextField

I use a listener in order to rebuild the view and lock the Add button when the textfield is empty.

## Theme

For styles I have modified theme and create a separate file for it.