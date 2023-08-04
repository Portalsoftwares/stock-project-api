<template>
	<div>
		<el-tabs type="border-card">
			<el-tab-pane label="របាយការណ៏វត្តមានសិស្ស">
				<div class="bg-white p-2 w-full flex justify-between">

					<div class="self-start">
						<el-input
							placeholder="ស្វែងរក"
							class="sanfont-khmer"
							v-model="search"
						>
							<i class="el-input__icon el-icon-search"></i>
							<CirclePlusFilled class="el-input__icon" />
						</el-input>
					</div>
					<div class="self-end">
						<el-button
							type="primary"
							@click="AddUser"
						>
							<el-icon>
								<CirclePlusFilled />
							</el-icon>
							<span class="mx-1 sanfont-khmer"> បន្ថែម មុខវិជ្ជា</span>
						</el-button>
					</div>
				</div>

			</el-tab-pane>
			<el-tab-pane label="របាយការណ៏ពិន្ទុសិស្ស">
				<div class="bg-white p-2 w-full flex justify-between">

					<div class="self-start">
						<el-input
							placeholder="ស្វែងរក"
							class="sanfont-khmer"
							v-model="search"
						>
							<i class="el-input__icon el-icon-search"></i>
							<CirclePlusFilled class="el-input__icon" />
						</el-input>
					</div>
					<div class="self-end">
						<el-button type="primary">
							<el-icon>
								<CirclePlusFilled />
							</el-icon>
							<span class="mx-1 sanfont-khmer"> បន្ថែម មុខវិជ្ជាតាមកំរិត</span>
						</el-button>
					</div>
				</div>

			</el-tab-pane>
		</el-tabs>
	</div>
</template>