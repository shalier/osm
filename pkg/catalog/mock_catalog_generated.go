// Code generated by MockGen. DO NOT EDIT.
// Source: github.com/openservicemesh/osm/pkg/catalog (interfaces: MeshCataloger)

// Package catalog is a generated GoMock package.
package catalog

import (
	reflect "reflect"

	gomock "github.com/golang/mock/gomock"
	certificate "github.com/openservicemesh/osm/pkg/certificate"
	endpoint "github.com/openservicemesh/osm/pkg/endpoint"
	envoy "github.com/openservicemesh/osm/pkg/envoy"
	service "github.com/openservicemesh/osm/pkg/service"
	smi "github.com/openservicemesh/osm/pkg/smi"
	trafficpolicy "github.com/openservicemesh/osm/pkg/trafficpolicy"
	v1alpha3 "github.com/servicemeshinterface/smi-sdk-go/pkg/apis/access/v1alpha3"
	v1alpha4 "github.com/servicemeshinterface/smi-sdk-go/pkg/apis/specs/v1alpha4"
	v1alpha2 "github.com/servicemeshinterface/smi-sdk-go/pkg/apis/split/v1alpha2"
)

// MockMeshCataloger is a mock of MeshCataloger interface
type MockMeshCataloger struct {
	ctrl     *gomock.Controller
	recorder *MockMeshCatalogerMockRecorder
}

// MockMeshCatalogerMockRecorder is the mock recorder for MockMeshCataloger
type MockMeshCatalogerMockRecorder struct {
	mock *MockMeshCataloger
}

// NewMockMeshCataloger creates a new mock instance
func NewMockMeshCataloger(ctrl *gomock.Controller) *MockMeshCataloger {
	mock := &MockMeshCataloger{ctrl: ctrl}
	mock.recorder = &MockMeshCatalogerMockRecorder{mock}
	return mock
}

// EXPECT returns an object that allows the caller to indicate expected use
func (m *MockMeshCataloger) EXPECT() *MockMeshCatalogerMockRecorder {
	return m.recorder
}

// ExpectProxy mocks base method
func (m *MockMeshCataloger) ExpectProxy(arg0 certificate.CommonName) {
	m.ctrl.T.Helper()
	m.ctrl.Call(m, "ExpectProxy", arg0)
}

// ExpectProxy indicates an expected call of ExpectProxy
func (mr *MockMeshCatalogerMockRecorder) ExpectProxy(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ExpectProxy", reflect.TypeOf((*MockMeshCataloger)(nil).ExpectProxy), arg0)
}

// GetConnectedProxyCount mocks base method
func (m *MockMeshCataloger) GetConnectedProxyCount() int {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetConnectedProxyCount")
	ret0, _ := ret[0].(int)
	return ret0
}

// GetConnectedProxyCount indicates an expected call of GetConnectedProxyCount
func (mr *MockMeshCatalogerMockRecorder) GetConnectedProxyCount() *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetConnectedProxyCount", reflect.TypeOf((*MockMeshCataloger)(nil).GetConnectedProxyCount))
}

// GetIngressPoliciesForService mocks base method
func (m *MockMeshCataloger) GetIngressPoliciesForService(arg0 service.MeshService) ([]*trafficpolicy.InboundTrafficPolicy, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetIngressPoliciesForService", arg0)
	ret0, _ := ret[0].([]*trafficpolicy.InboundTrafficPolicy)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// GetIngressPoliciesForService indicates an expected call of GetIngressPoliciesForService
func (mr *MockMeshCatalogerMockRecorder) GetIngressPoliciesForService(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetIngressPoliciesForService", reflect.TypeOf((*MockMeshCataloger)(nil).GetIngressPoliciesForService), arg0)
}

// GetPortToProtocolMappingForService mocks base method
func (m *MockMeshCataloger) GetPortToProtocolMappingForService(arg0 service.MeshService) (map[uint32]string, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetPortToProtocolMappingForService", arg0)
	ret0, _ := ret[0].(map[uint32]string)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// GetPortToProtocolMappingForService indicates an expected call of GetPortToProtocolMappingForService
func (mr *MockMeshCatalogerMockRecorder) GetPortToProtocolMappingForService(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetPortToProtocolMappingForService", reflect.TypeOf((*MockMeshCataloger)(nil).GetPortToProtocolMappingForService), arg0)
}

// GetResolvableServiceEndpoints mocks base method
func (m *MockMeshCataloger) GetResolvableServiceEndpoints(arg0 service.MeshService) ([]endpoint.Endpoint, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetResolvableServiceEndpoints", arg0)
	ret0, _ := ret[0].([]endpoint.Endpoint)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// GetResolvableServiceEndpoints indicates an expected call of GetResolvableServiceEndpoints
func (mr *MockMeshCatalogerMockRecorder) GetResolvableServiceEndpoints(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetResolvableServiceEndpoints", reflect.TypeOf((*MockMeshCataloger)(nil).GetResolvableServiceEndpoints), arg0)
}

// GetSMISpec mocks base method
func (m *MockMeshCataloger) GetSMISpec() smi.MeshSpec {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetSMISpec")
	ret0, _ := ret[0].(smi.MeshSpec)
	return ret0
}

// GetSMISpec indicates an expected call of GetSMISpec
func (mr *MockMeshCatalogerMockRecorder) GetSMISpec() *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetSMISpec", reflect.TypeOf((*MockMeshCataloger)(nil).GetSMISpec))
}

// GetServicesForServiceAccount mocks base method
func (m *MockMeshCataloger) GetServicesForServiceAccount(arg0 service.K8sServiceAccount) ([]service.MeshService, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetServicesForServiceAccount", arg0)
	ret0, _ := ret[0].([]service.MeshService)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// GetServicesForServiceAccount indicates an expected call of GetServicesForServiceAccount
func (mr *MockMeshCatalogerMockRecorder) GetServicesForServiceAccount(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetServicesForServiceAccount", reflect.TypeOf((*MockMeshCataloger)(nil).GetServicesForServiceAccount), arg0)
}

// GetServicesFromEnvoyCertificate mocks base method
func (m *MockMeshCataloger) GetServicesFromEnvoyCertificate(arg0 certificate.CommonName) ([]service.MeshService, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetServicesFromEnvoyCertificate", arg0)
	ret0, _ := ret[0].([]service.MeshService)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// GetServicesFromEnvoyCertificate indicates an expected call of GetServicesFromEnvoyCertificate
func (mr *MockMeshCatalogerMockRecorder) GetServicesFromEnvoyCertificate(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetServicesFromEnvoyCertificate", reflect.TypeOf((*MockMeshCataloger)(nil).GetServicesFromEnvoyCertificate), arg0)
}

// GetTargetPortToProtocolMappingForService mocks base method
func (m *MockMeshCataloger) GetTargetPortToProtocolMappingForService(arg0 service.MeshService) (map[uint32]string, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetTargetPortToProtocolMappingForService", arg0)
	ret0, _ := ret[0].(map[uint32]string)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// GetTargetPortToProtocolMappingForService indicates an expected call of GetTargetPortToProtocolMappingForService
func (mr *MockMeshCatalogerMockRecorder) GetTargetPortToProtocolMappingForService(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetTargetPortToProtocolMappingForService", reflect.TypeOf((*MockMeshCataloger)(nil).GetTargetPortToProtocolMappingForService), arg0)
}

// ListAllowedEndpointsForService mocks base method
func (m *MockMeshCataloger) ListAllowedEndpointsForService(arg0 service.K8sServiceAccount, arg1 service.MeshService) ([]endpoint.Endpoint, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListAllowedEndpointsForService", arg0, arg1)
	ret0, _ := ret[0].([]endpoint.Endpoint)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// ListAllowedEndpointsForService indicates an expected call of ListAllowedEndpointsForService
func (mr *MockMeshCatalogerMockRecorder) ListAllowedEndpointsForService(arg0, arg1 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListAllowedEndpointsForService", reflect.TypeOf((*MockMeshCataloger)(nil).ListAllowedEndpointsForService), arg0, arg1)
}

// ListAllowedInboundServiceAccounts mocks base method
func (m *MockMeshCataloger) ListAllowedInboundServiceAccounts(arg0 service.K8sServiceAccount) ([]service.K8sServiceAccount, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListAllowedInboundServiceAccounts", arg0)
	ret0, _ := ret[0].([]service.K8sServiceAccount)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// ListAllowedInboundServiceAccounts indicates an expected call of ListAllowedInboundServiceAccounts
func (mr *MockMeshCatalogerMockRecorder) ListAllowedInboundServiceAccounts(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListAllowedInboundServiceAccounts", reflect.TypeOf((*MockMeshCataloger)(nil).ListAllowedInboundServiceAccounts), arg0)
}

// ListAllowedOutboundServiceAccounts mocks base method
func (m *MockMeshCataloger) ListAllowedOutboundServiceAccounts(arg0 service.K8sServiceAccount) ([]service.K8sServiceAccount, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListAllowedOutboundServiceAccounts", arg0)
	ret0, _ := ret[0].([]service.K8sServiceAccount)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// ListAllowedOutboundServiceAccounts indicates an expected call of ListAllowedOutboundServiceAccounts
func (mr *MockMeshCatalogerMockRecorder) ListAllowedOutboundServiceAccounts(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListAllowedOutboundServiceAccounts", reflect.TypeOf((*MockMeshCataloger)(nil).ListAllowedOutboundServiceAccounts), arg0)
}

// ListAllowedOutboundServicesForIdentity mocks base method
func (m *MockMeshCataloger) ListAllowedOutboundServicesForIdentity(arg0 service.K8sServiceAccount) []service.MeshService {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListAllowedOutboundServicesForIdentity", arg0)
	ret0, _ := ret[0].([]service.MeshService)
	return ret0
}

// ListAllowedOutboundServicesForIdentity indicates an expected call of ListAllowedOutboundServicesForIdentity
func (mr *MockMeshCatalogerMockRecorder) ListAllowedOutboundServicesForIdentity(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListAllowedOutboundServicesForIdentity", reflect.TypeOf((*MockMeshCataloger)(nil).ListAllowedOutboundServicesForIdentity), arg0)
}

// ListEndpointsForService mocks base method
func (m *MockMeshCataloger) ListEndpointsForService(arg0 service.MeshService) ([]endpoint.Endpoint, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListEndpointsForService", arg0)
	ret0, _ := ret[0].([]endpoint.Endpoint)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// ListEndpointsForService indicates an expected call of ListEndpointsForService
func (mr *MockMeshCatalogerMockRecorder) ListEndpointsForService(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListEndpointsForService", reflect.TypeOf((*MockMeshCataloger)(nil).ListEndpointsForService), arg0)
}

// ListInboundTrafficPolicies mocks base method
func (m *MockMeshCataloger) ListInboundTrafficPolicies(arg0 service.K8sServiceAccount, arg1 []service.MeshService) []*trafficpolicy.InboundTrafficPolicy {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListInboundTrafficPolicies", arg0, arg1)
	ret0, _ := ret[0].([]*trafficpolicy.InboundTrafficPolicy)
	return ret0
}

// ListInboundTrafficPolicies indicates an expected call of ListInboundTrafficPolicies
func (mr *MockMeshCatalogerMockRecorder) ListInboundTrafficPolicies(arg0, arg1 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListInboundTrafficPolicies", reflect.TypeOf((*MockMeshCataloger)(nil).ListInboundTrafficPolicies), arg0, arg1)
}

// ListInboundTrafficTargetsWithRoutes mocks base method
func (m *MockMeshCataloger) ListInboundTrafficTargetsWithRoutes(arg0 service.K8sServiceAccount) ([]trafficpolicy.TrafficTargetWithRoutes, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListInboundTrafficTargetsWithRoutes", arg0)
	ret0, _ := ret[0].([]trafficpolicy.TrafficTargetWithRoutes)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// ListInboundTrafficTargetsWithRoutes indicates an expected call of ListInboundTrafficTargetsWithRoutes
func (mr *MockMeshCatalogerMockRecorder) ListInboundTrafficTargetsWithRoutes(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListInboundTrafficTargetsWithRoutes", reflect.TypeOf((*MockMeshCataloger)(nil).ListInboundTrafficTargetsWithRoutes), arg0)
}

// ListMonitoredNamespaces mocks base method
func (m *MockMeshCataloger) ListMonitoredNamespaces() []string {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListMonitoredNamespaces")
	ret0, _ := ret[0].([]string)
	return ret0
}

// ListMonitoredNamespaces indicates an expected call of ListMonitoredNamespaces
func (mr *MockMeshCatalogerMockRecorder) ListMonitoredNamespaces() *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListMonitoredNamespaces", reflect.TypeOf((*MockMeshCataloger)(nil).ListMonitoredNamespaces))
}

// ListOutboundTrafficPolicies mocks base method
func (m *MockMeshCataloger) ListOutboundTrafficPolicies(arg0 service.K8sServiceAccount) []*trafficpolicy.OutboundTrafficPolicy {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListOutboundTrafficPolicies", arg0)
	ret0, _ := ret[0].([]*trafficpolicy.OutboundTrafficPolicy)
	return ret0
}

// ListOutboundTrafficPolicies indicates an expected call of ListOutboundTrafficPolicies
func (mr *MockMeshCatalogerMockRecorder) ListOutboundTrafficPolicies(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListOutboundTrafficPolicies", reflect.TypeOf((*MockMeshCataloger)(nil).ListOutboundTrafficPolicies), arg0)
}

// ListSMIPolicies mocks base method
func (m *MockMeshCataloger) ListSMIPolicies() ([]*v1alpha2.TrafficSplit, []service.K8sServiceAccount, []*v1alpha4.HTTPRouteGroup, []*v1alpha3.TrafficTarget) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListSMIPolicies")
	ret0, _ := ret[0].([]*v1alpha2.TrafficSplit)
	ret1, _ := ret[1].([]service.K8sServiceAccount)
	ret2, _ := ret[2].([]*v1alpha4.HTTPRouteGroup)
	ret3, _ := ret[3].([]*v1alpha3.TrafficTarget)
	return ret0, ret1, ret2, ret3
}

// ListSMIPolicies indicates an expected call of ListSMIPolicies
func (mr *MockMeshCatalogerMockRecorder) ListSMIPolicies() *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListSMIPolicies", reflect.TypeOf((*MockMeshCataloger)(nil).ListSMIPolicies))
}

// ListServiceAccountsForService mocks base method
func (m *MockMeshCataloger) ListServiceAccountsForService(arg0 service.MeshService) ([]service.K8sServiceAccount, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListServiceAccountsForService", arg0)
	ret0, _ := ret[0].([]service.K8sServiceAccount)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// ListServiceAccountsForService indicates an expected call of ListServiceAccountsForService
func (mr *MockMeshCatalogerMockRecorder) ListServiceAccountsForService(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListServiceAccountsForService", reflect.TypeOf((*MockMeshCataloger)(nil).ListServiceAccountsForService), arg0)
}

// RegisterProxy mocks base method
func (m *MockMeshCataloger) RegisterProxy(arg0 *envoy.Proxy) {
	m.ctrl.T.Helper()
	m.ctrl.Call(m, "RegisterProxy", arg0)
}

// RegisterProxy indicates an expected call of RegisterProxy
func (mr *MockMeshCatalogerMockRecorder) RegisterProxy(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "RegisterProxy", reflect.TypeOf((*MockMeshCataloger)(nil).RegisterProxy), arg0)
}

// UnregisterProxy mocks base method
func (m *MockMeshCataloger) UnregisterProxy(arg0 *envoy.Proxy) {
	m.ctrl.T.Helper()
	m.ctrl.Call(m, "UnregisterProxy", arg0)
}

// UnregisterProxy indicates an expected call of UnregisterProxy
func (mr *MockMeshCatalogerMockRecorder) UnregisterProxy(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "UnregisterProxy", reflect.TypeOf((*MockMeshCataloger)(nil).UnregisterProxy), arg0)
}
