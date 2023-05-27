<template>
	<div
		class="bg-gray-800  text-white overflow-hidden"
		id="side-bar"
		:class="dataSibar == true ? 'side-bar-visible' : 'side-bar-close'"
	>
		<div
			style="height: 3rem"
			class="w-full"
		>
			<div class="h-full flex justify-center items-center  ">
				<span
					class="font-semibold uppercase text-xl px-6 whitespace-nowrap sanfont-khmer"
					v-if="dataSibar"
				>ប្រព័ន្ធ. វិទ្យាល័យ</span>
				<div
					class="text-center flex justify-center items-center h-full"
					v-if="!dataSibar"
				>
					<img
						src="https://apis.edu.kh/wp-content/uploads/2021/06/moeys-news.png"
						class="p-[2px] w-8 h-8 rounded-full ring-1 ring-gray-300 dark:ring-gray-500 "
						alt="Avatar"
					/>
				</div>
			</div>
			<div class="flex flex-col justify-between h-[calc(100vh-3rem)] w-full bg-gray-900">
				<div class="menu-man text-left px-2 whitespace-nowrap flex flex-col space-y-2 ">
					<div
						class="profile flex justify-center items-center text-center p-5 "
						v-show="dataSibar"
					>
						<div
							class="text-center flex-col flex justify-center items-center h-full"
							v-if="user"
						>

							<img
								src="https://apis.edu.kh/wp-content/uploads/2021/06/moeys-news.png"
								class="p-1 w-24 h-24 rounded-full ring-2 ring-gray-300 dark:ring-gray-500 mb-4"
								alt="Avatar"
							/>
							<h5 class="text-xl font-medium leading-tight mb-2">{{ user.name }}</h5>
							<p class="text-gray-500">{{ user.email }}</p>
						</div>
					</div>
					<div
						class="    rounded-sm cursor-pointer text-gray-300 hover:text-white"
						:class="dataSibar == true ? 'px-2' : ''"
					>
						<router-link
							to="/dashboard"
							class="py-2 px-2 flex space-x-2 items-center"
						>
							<el-icon style="font-size: 1.2rem">
								<Menu />
							</el-icon> <span
								v-show="dataSibar"
								class="sanfont-khmer"
							>ដាសបត</span>
						</router-link>
					</div>
					<div
						class="    rounded-md cursor-pointer  text-gray-300 hover:text-white"
						:class="dataSibar == true ? 'px-2' : ''"
					>
						<router-link
							to="/user"
							class="py-2 px-2 flex space-x-2 items-center"
						>
							<el-tooltip
								class="box-item"
								effect="dark"
								content="អ្នកប្រើប្រាស់ "
								placement="right-start"
							>
								<el-icon style="font-size: 1.2rem">
									<Avatar />
								</el-icon>
							</el-tooltip>

							<span
								v-show="dataSibar"
								class="sanfont-khmer"
							>អ្នកប្រើប្រាស់ </span>
						</router-link>
					</div>
					<div
						class="    rounded-md cursor-pointer  text-gray-300 hover:text-white"
						:class="dataSibar == true ? 'px-2' : ''"
					>
						<router-link
							to="/class"
							class="py-2 px-2 flex space-x-2 items-center"
						>
							<el-tooltip
								class="box-item"
								effect="dark"
								content="ថ្នាក់រៀន"
								placement="right-start"
							>
								<el-icon style="font-size: 1.2rem">
									<Suitcase />
								</el-icon>
							</el-tooltip>

							<span
								v-show="dataSibar"
								class="sanfont-khmer "
							> ថ្នាក់រៀន</span>
						</router-link>
					</div>
					<div
						class="    rounded-md cursor-pointer  text-gray-300 hover:text-white"
						:class="dataSibar == true ? 'px-2' : ''"
					>
						<router-link
							to="/class"
							class="py-2 px-2 flex space-x-2 items-center"
						>
							<el-tooltip
								class="box-item"
								effect="dark"
								content="វត្តមានសិស្ស"
								placement="right-start"
							>
								<el-icon style="font-size: 1.2rem">
									<Suitcase />
								</el-icon>
							</el-tooltip>

							<span
								v-show="dataSibar"
								class="sanfont-khmer "
							> វត្តមានសិស្ស</span>
						</router-link>
					</div>
				</div>
				<div class="menu-man text-left px-2 justify-self-end whitespace-nowrap">
					<div
						class="   py-3 rounded-md cursor-pointer text-gray-300 hover:text-white"
						:class="dataSibar == true ? 'px-2' : ''"
					>
						<a
							href="https://website-nuxt-front.vercel.app/"
							target="_blank"
							class="px-2 flex space-x-2"
						>
							<el-tooltip
								class="box-item"
								effect="dark"
								content="អំពីយើង"
								placement="right-start"
							>
								<el-icon style="font-size: 1.2rem">
									<Warning />
								</el-icon>
							</el-tooltip>

							<span
								v-show="dataSibar"
								class="sanfont-khmer"
							>អំពីយើង </span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import { mapGetters } from "vuex"
export default {
	data() {
		return {
			sideBarVisible: false,
		};
	},
	props: {
		dataSibar: Boolean,
	},
	computed: {
		...mapGetters({
			user: 'auth/user',
		})
	},
};
</script>

<style scoped>
.p-tooltip-text {
	font-size: 10px !important;
}

#side-bar {
	/* overflow: hidden; */
	transition: 300ms;
}

.side-bar-visible {
	width: 250px !important;
}

.side-bar-close {
	width: 50px !important;
}
</style>