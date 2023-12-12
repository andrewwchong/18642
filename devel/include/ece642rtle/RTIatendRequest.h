// Generated by gencpp from file ece642rtle/RTIatendRequest.msg
// DO NOT EDIT!


#ifndef ECE642RTLE_MESSAGE_RTIATENDREQUEST_H
#define ECE642RTLE_MESSAGE_RTIATENDREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ece642rtle
{
template <class ContainerAllocator>
struct RTIatendRequest_
{
  typedef RTIatendRequest_<ContainerAllocator> Type;

  RTIatendRequest_()
    : t()
    , x(0)
    , y(0)  {
    }
  RTIatendRequest_(const ContainerAllocator& _alloc)
    : t()
    , x(0)
    , y(0)  {
  (void)_alloc;
    }



   typedef ros::Time _t_type;
  _t_type t;

   typedef int8_t _x_type;
  _x_type x;

   typedef int8_t _y_type;
  _y_type y;





  typedef boost::shared_ptr< ::ece642rtle::RTIatendRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ece642rtle::RTIatendRequest_<ContainerAllocator> const> ConstPtr;

}; // struct RTIatendRequest_

typedef ::ece642rtle::RTIatendRequest_<std::allocator<void> > RTIatendRequest;

typedef boost::shared_ptr< ::ece642rtle::RTIatendRequest > RTIatendRequestPtr;
typedef boost::shared_ptr< ::ece642rtle::RTIatendRequest const> RTIatendRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ece642rtle::RTIatendRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ece642rtle::RTIatendRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ece642rtle::RTIatendRequest_<ContainerAllocator1> & lhs, const ::ece642rtle::RTIatendRequest_<ContainerAllocator2> & rhs)
{
  return lhs.t == rhs.t &&
    lhs.x == rhs.x &&
    lhs.y == rhs.y;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ece642rtle::RTIatendRequest_<ContainerAllocator1> & lhs, const ::ece642rtle::RTIatendRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ece642rtle

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::ece642rtle::RTIatendRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ece642rtle::RTIatendRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ece642rtle::RTIatendRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ece642rtle::RTIatendRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ece642rtle::RTIatendRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ece642rtle::RTIatendRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ece642rtle::RTIatendRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5d6e6d637d0e8170a0b6b92006975d55";
  }

  static const char* value(const ::ece642rtle::RTIatendRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5d6e6d637d0e8170ULL;
  static const uint64_t static_value2 = 0xa0b6b92006975d55ULL;
};

template<class ContainerAllocator>
struct DataType< ::ece642rtle::RTIatendRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ece642rtle/RTIatendRequest";
  }

  static const char* value(const ::ece642rtle::RTIatendRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ece642rtle::RTIatendRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "time t\n"
"int8 x\n"
"int8 y\n"
;
  }

  static const char* value(const ::ece642rtle::RTIatendRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ece642rtle::RTIatendRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.t);
      stream.next(m.x);
      stream.next(m.y);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RTIatendRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ece642rtle::RTIatendRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ece642rtle::RTIatendRequest_<ContainerAllocator>& v)
  {
    s << indent << "t: ";
    Printer<ros::Time>::stream(s, indent + "  ", v.t);
    s << indent << "x: ";
    Printer<int8_t>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<int8_t>::stream(s, indent + "  ", v.y);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ECE642RTLE_MESSAGE_RTIATENDREQUEST_H
