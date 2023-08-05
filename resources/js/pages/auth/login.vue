<template>
	<div>
		<div class="flex h-screen items-center justify-center px-4 sm:px-6 lg:px-8 ">
			<div class="w-[500px]  space-y-8 border p-8 shadow-lg">
				
				<div class="flex items-center justify-center ">
					<img  alt="logo" class="h-[100px] w-[80px] " src="../../assets/moey.png">
					</div>
					
				<div>
					<h2 class="mt-6 text-center text-2xl text-gray-800 sanfont-khmer">សាលាចំណេះទូទៅ និងបច្ចេកទេសពួក </h2>
					<h1 class="text-2xl text-gray-600 text-[20px] font-bold">PUOK TECHNICAL AND GENERAL SCHOOL </h1>
				</div>
				<form
					class="mt-8 space-y-6"
					id="login-form"
				>
					<input
						type="hidden"
						name="remember"
						value="true"
					/>
					<div class="space-y-[20px] rounded-md shadow-sm">
						<div>
							<label
								for="email-address"
								class="sr-only"
							>Email address</label>
							<input
								id="email-address"
								v-model="objData.email"
								name="email"
								type="email"
								class="relative block w-full h-full appearance-none rounded-lg  border border-gray-300 px-3 py-2 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm "
								placeholder="ឈ្មោះអ្នកប្រើប្រាស់/សារអេឡិចត្រូនិច"
								
							/>
						</div>
						
						<div>
							<label
								for="password"
								class="sr-only"
							>Password</label>
							<input
								
								id="password"
								v-model="objData.password"
								name="password"
								type="password"
								class="relative block w-full h-full appearance-none rounded-lg border border-gray-300 px-3 py-2  text-gray-900 placeholder-gray-500 focus:z-10 focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
								placeholder="ពាក្យសម្ងាត់"
							/>
						</div>
					</div>
					<div class="flex items-center justify-between">
						<div class="flex items-center">
							<input
								id="remember-me"
								name="remember-me"
								type="checkbox"
								class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500"
							/>
							<label
								for="remember-me"
								class="ml-2 block text-sm text-gray-900 text-[17px]"
							>ចងចាំអ្នកប្រើប្រាស់</label>
						</div>
						<div class="text-sm">

						</div>
					</div>
					<div>
					</div>
				</form>
				
				<div class="flex item-center justify-center">
				<button
					
					@click="login"
					class="group relative w-[90px] h-[50px] rounded-md border border-transparent bg-blue-600 py-2 px-4 text-[18px] font-bold text-white hover:bg-gray-700"
				>
					ចូល
				</button>
				</div>
			</div>
		</div>
	</div>
	<!-- <div class="bg-black before:animate-pulse before:bg-gradient-to-b before:from-gray-900 overflow-hidden before:via-[#00FF00] before:to-gray-900 before:absolute before:-inset-1">
		<div id="myDIV">
			<div class="w-[100vw] h-[100vh] flex items-center justify-center absolute">
				<div class="w-2/3 bg-gray-800 text-white z-50 py-4 px-8 rounded-lg">
					<div class="w-full flex justify-center text-[#00FF00] text-xl mb:2 md:mb-5">
						Sign In
					</div>
					<div class="mb-6">
						<label
							for="email"
							class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
						>Your email</label>
						<input
							type="email"
							id="email"
							class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-1 md:p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
							placeholder="name@neurolink.com"
							required
						>
					</div>
					<div class="mb-6">
						<label
							for="password"
							class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
						>Your password</label>
						<input
							type="password"
							id="password"
							class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-1 md:p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
							required
						>
					</div>
					<div class="flex flex-row justify-between">
						<div class="text-white">Forgot Password</div>
						<div class="text-[#00FF00]">Signup</div>
					</div>
					<div class="mt-4 md:mt-10 w-full flex justify-center text-sm md:text-xl bg-[#00FF00] py-2 rounded-md">
						Login
					</div>

				</div>
			</div>
		</div>
	</div> -->
</template>
<script>
export default {
	data() {
		return {
			

			objData: {
				email: 'sievmey@gmail.com',
				password: 'dev123',
				
			}
		}
	},
	mounted() {
	},
	methods: {
		login() {
			this.$store.dispatch("auth/LOGIN_SYSTEM", this.objData).then(reponse => {
				if (reponse.status == '201' && localStorage.getItem('token') != null) {
					this.$router.push('/');
				}else{
					
				}
				
			})
		}
	}
}
</script>

<style>

</style>