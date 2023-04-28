document.addEventListener("turbo:load", () => {
	const deleteLinks = document.querySelectorAll(".swal-delete-method");
	deleteLinks.forEach((deleteLink) => {
		deleteLink.addEventListener("click", (event) => {
			event.preventDefault();
			Swal.fire({
				title: "Are you sure?",
				text: deleteLink.getAttribute("data-confirm-swal"),
				icon: "warning",
				showCancelButton: true,
				confirmButtonColor: "#3085d6",
				cancelButtonColor: "#d33",
				confirmButtonText: "Yes, delete it!",
			}).then((result) => {
				if (result.isConfirmed) {
					const url = deleteLink.getAttribute("href");
					const token = document.querySelector(
						"meta[name='csrf-token']"
					).content;
					fetch(url, {
						method: "DELETE",
						headers: {
							"X-CSRF-Token": token,
						},
					})
						.then(() => {
							Swal.fire(
								"Deleted!",
								"Your category has been deleted.",
								"success"
							);
							setTimeout(() => {
								location.reload();
							}, 600); // delay reload for 2 seconds
						})
						.catch((error) => {
							console.error("Error:", error);
						});
				}
			});
		});
	});
});
