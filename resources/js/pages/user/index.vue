<template>
	<div>
	</div>
	<div class="grid grid-cols-1 gap-2 ">
		<div class=" border rounded bg-gray-50">
			<div class="flex flex-col  ">
				<div class="m-2" v-if="showSuccess">
					<el-alert title="success alert" type="success" show-icon />
				</div>
				<div class="m-2" v-if="showInfo">
					<el-alert title="info alert" type="info" show-icon />
				</div>
				<!-- <el-alert
					title="warning alert"
					type="warning"
					show-icon
				/>
				<el-alert
					title="error alert"
					type="error"
					show-icon
				/> -->
				<el-table :data="tableData" height="840" style="width: 100%">
					<el-table-column type="selection" width="55" />
					<el-table-column label="Name" width="120">
						<template #default="scope">{{ scope.row.name }}</template>
					</el-table-column>
					<el-table-column property="email" label="Email" width="300" />
					<el-table-column property="email_verified_at" label="email verified" width="300" />
					<el-table-column property="image" label="Image" width="200" />
					<el-table-column property="roles" label="Role" width="400">
						<template #default="scope">
							<div class="flex space-x-2">
								<div v-for="data in scope.row.roles " :key="data.id" class=" w-[400px]">
									<el-tag :type="data.name == 'super-admin' ? 'success' : 'info'" disable-transitions>{{ data.name }}</el-tag>
								</div>
							</div>
						</template>
					</el-table-column>
					<el-table-column fixed="right" label="Operations">
						<template #default="scope">
							<el-button size="small" @click="handleEdit(scope.$index, scope.row)">Edit</el-button>
							<el-button size="small" type="danger" @click="handleDelete(scope.$index, scope.row)">Delete</el-button>
						</template>
					</el-table-column>
				</el-table>
			</div>
		</div>
	</div>
</template>
<script>
export default {
	components: {},
	data() {

		return {
			tableData: [],
			showSuccess: false,
			showInfo: false
		}
	},
	computed: {

	},

	mounted() {
		this.getData()
	},
	methods: {
		async getData() {
			await axios.get('/user/get').then(response => {
				this.tableData = response.data.users
				console.log(this.tableData)
			})
		},
		notification() {
			this.showSuccess = !this.showSuccess
			ElNotification.success({
				title: 'Success',
				message: 'This is a success message',
				offset: 100,
			})
			ElMessage({
				message: 'Congrats, this is a success message.',
				type: 'success',
			})
		}
	}
}
</script>
<style scoped>
:global(h2#card-usage ~ .example .example-showcase) {
	background-color: var(--el-fill-color) !important;
}

.el-statistic {
	--el-statistic-content-font-size: 28px;
}

.statistic-card {
	height: 100%;
	padding: 20px;
	border-radius: 4px;
	background-color: var(--el-bg-color-overlay);
}

.statistic-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
	font-size: 12px;
	color: var(--el-text-color-regular);
	margin-top: 16px;
}

.statistic-footer .footer-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.statistic-footer .footer-item span:last-child {
	display: inline-flex;
	align-items: center;
	margin-left: 4px;
}

.green {
	color: var(--el-color-success);
}

.red {
	color: var(--el-color-error);
}
</style>