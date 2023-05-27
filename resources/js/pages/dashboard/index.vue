<template>
	<div class="grid grid-cols-3 gap-2 mb-2 ">
		<div class="col-span-2  border rounded shadow bg-gray-50 p-2">
			<el-row :gutter="16">
				<el-col :span="8">
					<div class="statistic-card">
						<el-statistic :value="98500">
							<template #title>
								<div style="display: inline-flex; align-items: center">
									Daily active users
									<el-tooltip
										effect="dark"
										content="Number of users who logged into the product in one day"
										placement="top"
									>
										<el-icon
											style="margin-left: 4px"
											:size="12"
										>
											<Warning />
										</el-icon>
									</el-tooltip>
								</div>
							</template>
						</el-statistic>
						<div class="statistic-footer">
							<div class="footer-item">
								<span>than yesterday</span>
								<span class="green">
									24%
									<el-icon>
										<CaretTop />
									</el-icon>
								</span>
							</div>
						</div>
					</div>
				</el-col>
				<el-col :span="8">
					<div class="statistic-card">
						<el-statistic :value="693700">
							<template #title>
								<div style="display: inline-flex; align-items: center">
									Monthly Active Users
									<el-tooltip
										effect="dark"
										content="Number of users who logged into the product in one month"
										placement="top"
									>
										<el-icon
											style="margin-left: 4px"
											:size="12"
										>
											<Warning />
										</el-icon>
									</el-tooltip>
								</div>
							</template>
						</el-statistic>
						<div class="statistic-footer">
							<div class="footer-item">
								<span>month on month</span>
								<span class="red">
									12%
									<el-icon>
										<CaretBottom />
									</el-icon>
								</span>
							</div>
						</div>
					</div>
				</el-col>
				<el-col :span="8">
					<div class="statistic-card">
						<el-statistic
							:value="72000"
							title="New transactions today"
						>
							<template #title>
								<div style="display: inline-flex; align-items: center">
									New transactions today
								</div>
							</template>
						</el-statistic>
						<div class="statistic-footer">
							<div class="footer-item">
								<span>than yesterday</span>
								<span class="green">
									16%
									<el-icon>
										<CaretTop />
									</el-icon>
								</span>
							</div>
							<div class="footer-item">
								<el-icon :size="14">
									<ArrowRight />
								</el-icon>
							</div>
						</div>
					</div>
				</el-col>
			</el-row>
		</div>
	</div>
	<div class="grid grid-cols-3 gap-2 ">
		<div class="col-span-2 border rounded  bg-gray-50">
			<div class="flex flex-col  ">
				<div
					class="m-2"
					v-if="showSuccess"
				>
					<el-alert
						title="success alert"
						type="success"
						show-icon
					/>
				</div>
				<div
					class="m-2"
					v-if="showInfo"
				>
					<el-alert
						title="info alert"
						type="info"
						show-icon
					/>
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
				<!-- <el-table
					:data="tableData"
					style="width: 100%"
				>
					<el-table-column
						prop="date"
						label="Date"
						width="150"
					/>
					<el-table-column label="Delivery Info">
						<el-table-column
							prop="name"
							label="Name"
							width="120"
						/>
						<el-table-column label="Address Info">
							<el-table-column
								prop="state"
								label="State"
								width="120"
							/>
							<el-table-column
								prop="city"
								label="City"
								width="120"
							/>
							<el-table-column
								prop="address"
								label="Address"
							/>
							<el-table-column
								prop="zip"
								label="Zip"
								width="120"
							/>
						</el-table-column>
					</el-table-column>
				</el-table> -->
			</div>
		</div>
		<!-- <div class="border rounded shadow bg-gray-50">
			<div class="w-full h-full  p-5">
				<el-timeline>
					<el-timeline-item
						timestamp="2018/4/12"
						placement="top"
					>
						<el-card>
							<h4>Update Github template</h4>
							<p>Tom committed 2018/4/12 20:46</p>
						</el-card>
					</el-timeline-item>
					<el-timeline-item
						timestamp="2018/4/3"
						placement="top"
					>
						<el-card>
							<h4>Update Github template</h4>
							<p>Tom committed 2018/4/3 20:46</p>
						</el-card>
					</el-timeline-item>
					<el-timeline-item
						timestamp="2018/4/2"
						placement="top"
					>
						<el-card>
							<h4>Update Github template</h4>
							<p>Tom committed 2018/4/2 20:46</p>
						</el-card>
					</el-timeline-item>
				</el-timeline>
			</div>
		</div> -->
	</div>
</template>
<script>
import { ElNotification, ElMessage } from 'element-plus'
export default {
	components: {},
	data() {
		const tableData = [
			{
				date: '2016-05-03',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-02',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-04',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-01',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-08',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-06',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-07',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
		]
		return {
			tableData,
			showSuccess: false,
			showInfo: false
		}
	},
	computed: {

	},

	mounted() {

	},
	methods: {
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