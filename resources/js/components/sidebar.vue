<template>
	<div
		class=" text-white  "
		id="side-bar"
		:class="dataSibar == true ? 'side-bar-visible' : 'side-bar-close'"
	>
		<div
			style="height: 3rem"
			class="w-full"
		>
			<div class="h-full flex justify-center items-center shadow-md bg-blue-900">
				<span
					class="font-semibold uppercase text-[15	px] px-6 whitespace-nowrap sanfont-khmer"
					v-if="dataSibar"
				>វិទ្យាល័យចំណេះទូទៅ និងបច្ចេកទេសពួក</span>
				<div
					class="text-center flex justify-center items-center h-full"
					v-if="!dataSibar"
				>
					<img
						src="../assets/moey-small.png"
						class="p-[2px] w-8 h-8 rounded-full ring-1 ring-gray-300 dark:ring-gray-500 "
						alt="Avatar"
					/>
				</div>
			</div>
			
			<div class="flex flex-col justify-between h-[calc(100vh-3rem)] w-full bg-blue-900">
				<div class="menu-man text-left  whitespace-nowrap flex flex-col space-y-2 ">
					<div
						class="profile flex justify-center items-center text-center p-5 "
						v-show="dataSibar"
					>
						<div class="pb-[30px]">
						<div
							class="text-center flex-col flex justify-center items-start h-full "
							v-if="user"
						>

							<!-- <img
								src="https://apis.edu.kh/wp-content/uploads/2021/06/moeys-news.png"
								class="p-1 w-24 h-24 rounded-full ring-2 ring-gray-300 dark:ring-gray-500 mb-4"
								alt="Avatar"
							/> -->
							<img
								src="../assets/moey.png"
								class="p-1 w-28 h-36 rounded-full mb-4"
								alt="Avatar1"
							/>
							<!--  <div class="text-xl font-medium leading-tight mb-2 sanfont-khmer">{{ user.roles[0].name }}</div>  -->
						</div>
					</div>
					</div>
					
					<div
						class="    rounded-sm cursor-pointer text-white hover:text-gray-300"
						:class="dataSibar == true ? ' ' : ''"
					>
						<router-link
							to="/dashboard"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-icon style="font-size: 1.8rem">
								<PieChart />
							</el-icon> 
							<div class="pl-[3px] pt-[3px]">
								<span
								v-show="dataSibar"
								class="sanfont-khmer text-[19px] "
							>ដាសបត</span>
							</div>	
						</router-link>
					</div>
					<div
						class="    rounded-md cursor-pointer  text-white hover:text-gray-300"
						:class="dataSibar == true ? ' ' : ''"
					>
					<router-link
							to="/user"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-icon style="font-size: 1.8rem">
								<User />
							</el-icon> 
							<div class="pl-[3px] pt-[3px]">
								<span
								v-show="dataSibar"
								class="sanfont-khmer text-[19px] "
							>អ្នកប្រើប្រាស់</span>
							</div>	
						</router-link>
					</div>
					<div
						class="    rounded-md cursor-pointer  text-white hover:text-gray-300"
						:class="dataSibar == true ? ' ' : ''"
					>
					<router-link
							to="/teacher"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-icon style="font-size: 1.8rem">
								<Coordinate />
							</el-icon> 
							<div class="pl-[3px] pt-[3px]">
								<span
								v-show="dataSibar"
								class="sanfont-khmer text-[19px] "
							>គ្រូបង្រៀន</span>
							</div>	
						</router-link>
					</div>
					<div
						class="    rounded-md cursor-pointer  text-white hover:text-gray-300"
						:class="dataSibar == true ? ' ' : ''"
					>
					<router-link
							to="/student"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-icon style="font-size: 1.8rem">
								<Place />
							</el-icon> 
							<div class="pl-[3px] pt-[3px]">
								<span
								v-show="dataSibar"
								class="sanfont-khmer text-[19px] "
							>សិក្សានុសិស្ស</span>
							</div>	
						</router-link>
					</div>

					<div
						class="    rounded-md cursor-pointer  text-white hover:text-gray-300"
						:class="dataSibar == true ? ' ' : ''"
					>
					<router-link
							to="/subject"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-icon style="font-size: 1.8rem">
								<Reading />
							</el-icon> 
							<div class="pl-[3px] pt-[3px]">
								<span
								v-show="dataSibar"
								class="sanfont-khmer text-[19px] "
							>មុខវិជ្ជា</span>
							</div>	
						</router-link>
					</div>
					<div
						class="    rounded-md cursor-pointer  text-white hover:text-gray-300"
						:class="dataSibar == true ? ' ' : ''"
					>
					<router-link
							to="/class"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-icon style="font-size: 1.8rem">
								<OfficeBuilding />
							</el-icon> 
							<div class="pl-[3px] pt-[3px]">
								<span
								v-show="dataSibar"
								class="sanfont-khmer text-[19px] "
							>ថ្នាក់រៀន</span>
							</div>	
						</router-link>
					</div>
					<div
						class="    rounded-md cursor-pointer  text-white hover:text-gray-300  "
						:class="dataSibar == true ? ' ' : ''"
					>
					<router-link
							to="/reports"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-icon style="font-size: 1.8rem">
								<DocumentCopy />
							</el-icon> 
							<div class="pl-[3px] pt-[3px]">
								<span
								v-show="dataSibar"
								class="sanfont-khmer text-[19px] "
							>របាយការណ៍</span>
							</div>	
						</router-link>
					</div>
				</div>
				<div class="menu-man text-left px-1 justify-self-end whitespace-nowrap">
					<div
						class="   py-3 rounded-md cursor-pointer text-white hover:text-gray-300"
						:class="dataSibar == true ? ' ' : ''"
					>
						<router-link
							to="/setting"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
						<el-icon style="font-size: 1.8rem">
									<Setting />
								</el-icon>
							<div class="pl-[3px] pt-[3px]">
								<span
								v-show="dataSibar"
								class="sanfont-khmer text-[19px] "
							>ការកំណត់</span>
							</div>	
						</router-link>
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
	methods: {
		activeMenuNameRoute(name) {
			return this.$route.name.includes(name);
		}
	}
};
</script>

<style >
.p-tooltip-text {
	font-size: 10px !important;
}
</style>