**DAY-2**

**EC2-Elastic Cloud Compute**

The word Elastic means scalable (you can increase and decrease the resources based on the traffic and Cloud is nothing but you are accessing the computing resources 
over the internet,without physical infrastructure.Finally, the word compute refers to CPU and RAM.
When we request compute from AWS, it's nothing but we are essentially asking for Virtual servers.
Virtual servers are created using the concept of **virtualization** is enabled using a Hypervisor-A software that sits on top of physical server that creates and manages the
virtual machines(VM).It also allocates resources to each VM.
EX: If you have a physical laptop and want multiple users to use it independently:
1. you install a hypervisor
2. creates multiple VM's
3. Each VM acts like a seperate system.

**Advantages of EC2**

1. No need to maintain physical servers
2. Highly scalable
3. Cost-effective
4. Follows pay-as-you-go pricing model

We also have types in EC2 instances which are designed for different type of workloads.

1. **General Purpose**:Provides a Balance between compute, memory, and networking.Ideal for application servers and backend services with moderate workloads.
2. **Compute Optimized**: High-performance CPUs for compute-intensive tasks like gaming, batch processing, and scientific computations.
3. **Memory Optimized**: Designed for fast processing of large in-memory datasets, such as databases and real-time analytics.
4. **Accelerated Computing**: Uses GPUs or coprocessors for tasks like graphics rendering, machine learning, and complex calculations.
5. **Storage Optimized**: High-speed local storage for heavy read/write workloads like data warehousing, distributed file systems, and OLTP systems.
6. **HPC optimized** : High performance computing used for tightly coupled workloads like simulations, scientific modeling, and weather forecasting.


   
