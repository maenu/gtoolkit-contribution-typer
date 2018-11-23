Class {
	#name : #CovCoverageBodyStyler,
	#superclass : #GtCoderBodyStyler,
	#category : #'Coverage-GToolkit'
}

{ #category : #visiting }
CovCoverageBodyStyler >> styleFrom: from to: to with: attributes [
	"style only if within body"

	from - patternSource size - 1 <= 0
		ifFalse: [ super styleFrom: from to: to with: attributes ]
]

{ #category : #visiting }
CovCoverageBodyStyler >> styleValueNode: aNode [
	| summary |
	summary := aNode covClasses.
	self
		styleFrom: aNode stop
		to: aNode stop
		with:
			{(CovSummaryClassAttribute new
				summary: summary;
				yourself).
			(CovSummarySizeAttribute new
				summary: summary;
				yourself).
			(CovSummaryExpandButtonAttribute new
				summary: summary;
				yourself)}
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitArgumentNode: aNode [
	super visitArgumentNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitArrayNode: aNode [
	super visitArrayNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitBlockNode: aNode [
	super visitBlockNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitGlobalNode: aNode [
	super visitGlobalNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitInstanceVariableNode: aNode [
	super visitInstanceVariableNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitLiteralArrayNode: aNode [
	super visitLiteralArrayNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitMessageNode: aNode [
	super visitMessageNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitSelfNode: aNode [
	super visitSelfNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitSuperNode: aNode [
	super visitSuperNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitTemporaryNode: aNode [
	super visitTemporaryNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitThisContextNode: aNode [
	super visitThisContextNode: aNode.
	self styleValueNode: aNode
]
