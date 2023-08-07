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
				<div
					class="font-semibold uppercase text-md px-2 whitespace-nowrap sanfont-khmer flex py-2 items-center "
					v-if="dataSibar"
				>
					<img
						src="https://apis.edu.kh/wp-content/uploads/2021/06/moeys-news.png"
						class="w-[50px] h-[50px] ml-[-10px]"
						alt="Avatar"
					/>
					<span>វិ.ចំណេះទូទៅនិង បច្ចេកទេសពួក</span>
				</div>
				<div
					class="text-center flex justify-center items-center h-full"
					v-if="!dataSibar"
				>
					<img
						src="https://apis.edu.kh/wp-content/uploads/2021/06/moeys-news.png"
						class="p-[2px] w-[50px] h-[50px]  "
						alt="Avatar"
					/>
				</div>
			</div>
			<div class="flex flex-col justify-between h-[calc(100vh-3rem)] w-full bg-blue-900 py-4">
				<div class="menu-man text-left  whitespace-nowrap flex flex-col space-y-2 ">
					<!-- <div
						class="profile flex justify-center items-center text-center p-5 "
						v-show="dataSibar"
					> -->
					<!-- <div
							class="text-center flex-col flex justify-center items-center h-full"
							v-if="user"
						> -->

					<!-- <img
								src="https://apis.edu.kh/wp-content/uploads/2021/06/moeys-news.png"
								class="p-1 w-24 h-24 rounded-full ring-2 ring-gray-300 dark:ring-gray-500 mb-4"
								alt="Avatar"
							/> -->
					<!-- <img
								:src="user.img!=null ? user.img.file_path: 'https://th.bing.com/th/id/OIP.PJB4lxw88QRaADN8UWxV4AHaHa?pid=ImgDet&rs=1'"
								class="p-1 w-24 h-24 rounded-full ring-2 ring-gray-300 dark:ring-gray-500 mb-4"
								alt="Avatar"
							/> -->
					<!-- <div class="text-xl font-medium leading-tight mb-2 sanfont-khmer">{{ user.roles[0].name }}</div> -->
					<!-- </div> -->
					<!-- </div> -->
					<div
						class="    rounded-sm cursor-pointer text-gray-300 hover:text-white"
						:class="dataSibar == true ? ' ' : ''"
					>
						<router-link
							to="/dashboard"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-icon style="font-size: 1.5rem">

								<Eleme />
							</el-icon> <span
								v-show="dataSibar"
								class="sanfont-khmer text-sm"
							>ដាសបត</span>
						</router-link>
					</div>
					<div
						class="    rounded-md cursor-pointer  text-gray-300 hover:text-white"
						:class="dataSibar == true ? ' ' : ''"
					>
						<router-link
							to="/user"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-tooltip
								class="box-item"
								effect="dark"
								content="អ្នកប្រើប្រាស់ "
								placement="right-start"
							>
								<!-- <el-icon style="font-size: 1.2rem">
									<Avatar />
								</el-icon> -->
								<el-icon style="font-size: 1.5rem">
									<User />
								</el-icon>
							</el-tooltip>

							<span
								v-show="dataSibar"
								class="sanfont-khmer text-sm"
							>អ្នកប្រើប្រាស់ </span>
						</router-link>
					</div>
					<div
						class="    rounded-md cursor-pointer  text-gray-300 hover:text-white"
						:class="dataSibar == true ? ' ' : ''"
					>
						<router-link
							to="/teacher"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-tooltip
								class="box-item"
								effect="dark"
								content="គ្រូបង្រៀន"
								placement="right-start"
							>
								<!-- <el-icon style="font-size: 1.2rem">
									<Suitcase />
								</el-icon> -->
								<el-icon style="font-size: 1.5rem">
									<Avatar />
								</el-icon>
							</el-tooltip>

							<span
								v-show="dataSibar"
								class="sanfont-khmer text-sm"
							> គ្រូបង្រៀន</span>
						</router-link>
					</div>
					<div
						class="    rounded-md cursor-pointer  text-gray-300 hover:text-white"
						:class="dataSibar == true ? ' ' : ''"
					>
						<router-link
							to="/student"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-tooltip
								class="box-item"
								effect="dark"
								content="សិស្សានុសិស្ស"
								placement="right-start"
							>
								<!-- <el-icon style="font-size: 1.2rem">
									<User />
								</el-icon> -->
								<el-icon style="font-size: 1.5rem">
									<UserFilled />
								</el-icon>
							</el-tooltip>

							<span
								v-show="dataSibar"
								class="sanfont-khmer text-sm"
							> សិស្សានុសិស្ស</span>
						</router-link>
					</div>

					<div
						class="    rounded-md cursor-pointer  text-gray-300 hover:text-white"
						:class="dataSibar == true ? ' ' : ''"
					>
						<router-link
							to="/subject"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-tooltip
								class="box-item"
								effect="dark"
								content="មុខវិជ្ជា"
								placement="right-start"
							>
								<!-- <el-icon style="font-size: 1.2rem">
									<Suitcase />
								</el-icon> -->
								<el-icon style="font-size: 1.5rem">
									<Reading />
								</el-icon>
							</el-tooltip>

							<span
								v-show="dataSibar"
								class="sanfont-khmer text-sm"
							> មុខវិជ្ជា</span>
						</router-link>
					</div>
					<div
						class="    rounded-md cursor-pointer  text-gray-300 hover:text-white"
						:class="dataSibar == true ? ' ' : ''"
					>
						<router-link
							to="/class"
							:class="[activeMenuNameRoute('class')?'router-link-exact-active':'']"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-tooltip
								class="box-item"
								effect="dark"
								content="ថ្នាក់រៀន"
								placement="right-start"
							>

								<el-icon style="font-size: 1.5rem">
									<OfficeBuilding />
								</el-icon>
							</el-tooltip>
							<span
								v-show="dataSibar"
								class="sanfont-khmer  text-sm"
							> ថ្នាក់រៀន</span>
						</router-link>
					</div>
					<div
						class="    rounded-md cursor-pointer  text-gray-300 hover:text-white"
						:class="dataSibar == true ? ' ' : ''"
					>
						<router-link
							to="/time"
							:class="[activeMenuNameRoute('time')?'router-link-exact-active':'']"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-tooltip
								class="box-item"
								effect="dark"
								content="ម៉ោងពេល"
								placement="right-start"
							>

								<el-icon style="font-size: 1.5rem">
									<Clock />
								</el-icon>
							</el-tooltip>
							<span
								v-show="dataSibar"
								class="sanfont-khmer  text-sm"
							> ម៉ោងសិក្សា</span>
						</router-link>
					</div>
					<div
						class="    rounded-md cursor-pointer  text-gray-300 hover:text-white"
						:class="dataSibar == true ? ' ' : ''"
					>
						<router-link
							to="/academic"
							:class="[activeMenuNameRoute('academic')?'router-link-exact-active':'']"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-tooltip
								class="box-item"
								effect="dark"
								content="ឆ្នាំសិក្សា"
								placement="right-start"
							>

								<el-icon style="font-size: 1.5rem">
									<CollectionTag />
								</el-icon>
							</el-tooltip>
							<span
								v-show="dataSibar"
								class="sanfont-khmer  text-sm"
							> ឆ្នាំសិក្សា</span>
						</router-link>
					</div>
					<div
						class="    rounded-md cursor-pointer  text-gray-300 hover:text-white  "
						:class="dataSibar == true ? ' ' : ''"
					>
						<router-link
							to="/reports"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-tooltip
								class="box-item"
								effect="dark"
								content="របាយការណ៍"
								placement="right-start"
							>
								<el-icon style="font-size: 1.5rem">
									<PieChart />
								</el-icon>
							</el-tooltip>
							<span
								v-show="dataSibar"
								class="sanfont-khmer  text-sm"
							> របាយការណ៍</span>
						</router-link>
					</div>
				</div>
				<div class="menu-man text-left  whitespace-nowrap flex flex-col space-y-2">
					<div
						class="    rounded-md cursor-pointer  text-gray-300 hover:text-white"
						:class="dataSibar == true ? ' ' : ''"
					>
						<router-link
							to="/setting"
							class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900"
						>
							<el-tooltip
								class="box-item"
								effect="dark"
								content="ការកំណត់"
								placement="right-start"
							>
								<el-icon style="font-size: 1.5rem">
									<Tools />
								</el-icon>
							</el-tooltip>

							<span
								v-show="dataSibar"
								class="sanfont-khmer text-sm"
							> ការកំណត់</span>
						</router-link>
					</div>
					<div
						class="    rounded-md cursor-pointer  text-gray-300 hover:text-white"
						:class="dataSibar == true ? ' ' : ''"
					>
						<div class="py-2 px-2 flex space-x-2 items-center border-l-[4px] border-blue-900">
							<el-tooltip
								class="box-item"
								effect="dark"
								content="បង្កើតដោយ Copyright @ 2023 BIT14"
								placement="right-start"
							>
								<!-- <el-icon>
									<InfoFilled />
								</el-icon> -->
								<span style="font-size: 1.5rem"> &copy;</span>
							</el-tooltip>

							<span
								v-show="dataSibar"
								class="sanfont-khmer text-sm"
							> បង្កើតដោយ @ 2023 BIT14</span>
						</div>
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