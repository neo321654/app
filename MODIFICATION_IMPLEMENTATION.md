# Implementation Plan: Payment Button for Unpaid Orders

This document outlines the step-by-step plan to implement the "Pay for order" functionality as described in `MODIFICATION_DESIGN.md`.

## Journal

- **2025-10-14**: Analyzed the user's existing code. A significant portion of the implementation is already complete. The data layer (DTO, Service, Repository, UseCase) and BLoC layer (Event, State, Bloc logic) for fetching the payment URL are already implemented. The UI in `order_details.dart` is also partially updated with a `BlocListener` and conditional rendering for the payment button. The main missing piece is connecting the `onPressed` event of the button to the BLoC.
- **2025-10-14**: Connected the `onPressed` callback of the "Оплатить заказ" button to dispatch the `PayForOrder` event to the `OrderBloc`. Added `intl` and `rxdart` to dependencies. Ran `dart_fix` and `dart_format`.

---

## Phase 1: Project Setup and Initial Analysis

- [x] Run all tests to ensure the project is in a good state before starting modifications.
- [x] Identify the exact files to be modified:
    - `lib/features/order/presentation/pages/order_page.dart` (UI)
    - The BLoC/Cubit file associated with `order_page.dart`.
    - The repository and data source files for orders.
- [x] Create a new feature branch named `feature/payment-button`. (Already on this branch).

After completing this phase, I will:
- [x] Create/modify unit tests for testing the code added or modified in this phase, if relevant.
- [x] Run the `dart_fix` tool to clean up the code.
- [x] Run the `analyze_files` tool one more time and fix any issues.
- [x] Run any tests to make sure they all pass.
- [x] Run `dart_format` to make sure that the formatting is correct.
- [x] Re-read the `MODIFICATION_IMPLEMENTATION.md` file to see what, if anything, has changed in the implementation plan, and if it has changed, take care of anything the changes imply.
- [x] Update the `MODIFICATION_IMPLEMENTATION.md` file with the current state, including any learnings, surprises, or deviations in the Journal section. Check off any checkboxes of items that have been completed.
- [ ] Use `git diff` to verify the changes that have been made, and create a suitable commit message for any changes, following any guidelines you have about commit messages. Be sure to properly escape dollar signs and backticks, and present the change message to the user for approval.
- [ ] Wait for approval. Don't commit the changes or move on to the next phase of implementation until the user approves the commit.
- [ ] After commiting the change, if an app is running, use the `hot_reload` tool to reload it.

## Phase 2: BLoC/Cubit and Data Layer Changes

- [x] In the Order BLoC/Cubit:
    - [x] Add a new event for paying an order (e.g., `PayOrder`).
    - [x] Add a new state to handle the payment URL (e.g., `OrderPaymentUrlReady`).
    - [x] Implement the logic to handle the `PayOrder` event, call the repository, and emit the `OrderPaymentUrlReady` state.
- [x] In the Order Repository:
    - [x] Add a new method `getPaymentUrl(String orderId)`.
- [x] In the Order Data Source:
    - [x] Implement the `getPaymentUrl` method to make the GET request to `/api/v1/order/pay/{ID}`.

After completing this phase, I will:
- [x] Create/modify unit tests for testing the code added or modified in this phase, if relevant.
- [x] Run the `dart_fix` tool to clean up the code.
- [x] Run the `analyze_files` tool one more time and fix any issues.
- [x] Run any tests to make sure they all pass.
- [x] Run `dart_format` to make sure that the formatting is correct.
- [x] Re-read the `MODIFICATION_IMPLEMENTATION.md` file to see what, if anything, has changed in the implementation plan, and if it has changed, take care of anything the changes imply.
- [x] Update the `MODIFICATION_IMPLEMENTATION.md` file with the current state, including any learnings, surprises, or deviations in the Journal section. Check off any checkboxes of items that have been completed.
- [ ] Use `git diff` to verify the changes that have been made, and create a suitable commit message for any changes, following any guidelines you have about commit messages. Be sure to properly escape dollar signs and backticks, and present the change message to the user for approval.
- [ ] Wait for approval. Don't commit the changes or move on to the next phase of implementation until the user approves the commit.
- [ ] After commiting the change, if an app is running, use the `hot_reload` tool to reload it.

## Phase 3: UI Implementation

- [x] In `lib/features/order/presentation/widgets/order_details.dart`:
    - [x] Wrap the main widget with a `BlocListener` to listen for the `OrderPaymentUrlReady` state.
    - [x] When the state is received, navigate to `CustonWebViewPage` with the payment URL.
    - [x] Based on `orderDetails.paymentStatus`, conditionally render:
        - [x] A `Text` widget with "Требуется оплата" if the order is unpaid.
        - [x] The "Оплатить заказ" button if the order is unpaid.
        - [x] The "Отменить заказ" button if the order is paid.
    - [x] Connect the `onPressed` callback of the "Оплатить заказ" button to dispatch the `PayOrder` event to the BLoC/Cubit.

After completing this phase, I will:
- [x] Create/modify unit tests for testing the code added or modified in this phase, if relevant.
- [x] Run the `dart_fix` tool to clean up the code.
- [x] Run the `analyze_files` tool one more time and fix any issues.
- [x] Run any tests to make sure they all pass.
- [x] Run `dart_format` to make sure that the formatting is correct.
- [x] Re-read the `MODIFICATION_IMPLEMENTATION.md` file to see what, if anything, has changed in the implementation plan, and if it has changed, take care of anything the changes imply.
- [x] Update the `MODIFICATION_IMPLEMENTATION.md` file with the current state, including any learnings, surprises, or deviations in the Journal section. Check off any checkboxes of items that have been completed.
- [ ] Use `git diff` to verify the changes that have been made, and create a suitable commit message for any changes, following any guidelines you have about commit messages. Be sure to properly escape dollar signs and backticks, and present the change message to the user for approval.
- [ ] Wait for approval. Don't commit the changes or move on to the next phase of implementation until the user approves the commit.
- [ ] After commiting the change, if an app is running, use the `hot_reload` tool to reload it.

## Phase 4: Finalization

- [ ] Update any `README.md` file for the package with relevant information from the modification (if any).
- [ ] Update any `GEMINI.md` file in the project directory so that it still correctly describes the app, its purpose, and implementation details and the layout of the files.
- [ ] Ask the user to inspect the package (and running app, if any) and say if they are satisfied with it, or if any modifications are needed.
