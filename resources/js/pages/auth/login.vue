<template>
	<div>
		<div class="flex h-screen items-center justify-center px-4 sm:px-6 lg:px-8  bg-gray-50 ">
			<div class="w-[550px]  space-y-8 border py-8 px-9 shadow bg-gray-100 rounded">

				<div class="flex items-center justify-center ">
					<img
						alt="logo"
						class="h-[100px] w-[80px] "
						src="../../assets/moey.png"
					>
				</div>

				<div>
					<h2 class="mt-6 text-center text-3xl text-gray-800 sanfont-khmer">សាលាចំណេះទូទៅ និងបច្ចេកទេសពួក </h2>
					<h1 class="text-2xl text-gray-600 text-[20px] font-bold">PUOK TECHNICAL AND GENERAL SCHOOL </h1>
				</div>
				<div>
					<el-alert
						title="ជោគជ័យ"
						type="success"
						description=""
						show-icon
						v-show="successfull"
						:closable="false"
					/>
					<el-alert
						title="ព័ត៏មានអ្នកប្រើប្រាស់មិនត្រឹមត្រូវ"
						type="error"
						:description="message"
						show-icon
						v-show="failed"
						:closable="false"
					/>
				</div>
				<el-form
					class="mt-4 "
					id="login-form"
					:model="objData"
					:rules="rules"
					ref="formLogin"
				>
					<input
						type="hidden"
						name="remember"
						value="true"
					/>
					<div class="space-y-[10px] rounded-md shadow-sm">
						<div class="flex justify-center w-full ">
							<el-form-item prop="email">
								<el-input
									v-model="objData.email"
									name="email"
									placeholder="ឈ្មោះអ្នកប្រើប្រាស់/សារអេឡិចត្រូនិច"
									size="large"
								/>
							</el-form-item>

						</div>

						<div class="flex justify-center ">
							<el-form-item prop="password">
								<el-input
									v-model="objData.password"
									type="password"
									placeholder="ពាក្យសម្ងាត់"
									name="password"
									show-password
									size="large"
								/>
							</el-form-item>
						</div>
						<div class="flex justify-center ">
							<el-form-item>

								<el-checkbox
									name="remember-me"
									v-model="rememberMe"
									label="ចងចាំអ្នកប្រើប្រាស់"
								/>

							</el-form-item>
						</div>
					</div>
				</el-form>
				<div class="flex item-center justify-center">
					<el-button
						type="primary"
						@click="submitForm('formLogin')"
						:loading="loading"
					>ចូលប្រើប្រព័ន្ធ</el-button>
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
			loading: false,
			objData: {
				email: '',
				password: '',

			},
			rules: {
				email: [
					{ required: true, message: 'សូមបញ្ចូល ឈ្មោះអ្នកប្រើប្រាស់/សារអេឡិចត្រូនិច', trigger: 'blur' }
				],
				password: [
					{ required: true, message: 'ពាក្យសម្ងាត់', trigger: 'blur' }
				],

			},
			failed: false,
			successfull: false,
			message: '',
			rememberMe: false
		}
	},
	mounted() {
		this.rememberMe = localStorage.getItem('remember_me') ?? false
		if (this.rememberMe == 'true') {
			this.rememberMe = true
			this.objData.email = localStorage.getItem('prarams1')
			this.objData.password = localStorage.getItem('prarams2')
		} else {
			this.rememberMe = false
			this.objData.email = ''
			this.objData.password = ''
		}
	},
	methods: {
		submitForm(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					this.login()
				}
			});
		},
		login() {
			this.loading = true;
			this.failed = false;
			this.successfull = false;
			this.$store.dispatch("auth/LOGIN_SYSTEM", this.objData).then(reponse => {
				console.log(reponse)
				if (reponse.status == '200' && localStorage.getItem('token') != null) {
					localStorage.setItem('remember_me', this.rememberMe)
					if (this.rememberMe) {
						localStorage.setItem('prarams1', this.objData.email)
						localStorage.setItem('prarams2', this.objData.password)
					} else {
						localStorage.setItem('prarams1', '')
						localStorage.setItem('prarams2', '')
					}
					this.successfull = true
					const self = this
					setTimeout(() => {
						self.$router.push('/');
					}, 900)
					this.loading = false;
				} else {
					this.failed = true;
					this.message = reponse.response?.data?.message;
					this.loading = false;

				}

			})
		}
	}
}
</script>

<style>
.el-alert__content {
	text-align: left !important;
}
</style>