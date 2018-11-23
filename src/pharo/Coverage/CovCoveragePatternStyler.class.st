Class {
	#name : #CovCoveragePatternStyler,
	#superclass : #Object,
	#traits : 'TRBProgramNodeVisitor',
	#classTraits : 'TRBProgramNodeVisitor classTrait',
	#instVars : [
		'source'
	],
	#category : #'Coverage-GToolkit'
}

{ #category : #private }
CovCoveragePatternStyler >> extraStyle: aText ast: ast [
	
]

{ #category : #private }
CovCoveragePatternStyler >> style: aText ast: ast [
	source := aText asString.
	self visitNode: ast
]

{ #category : #visiting }
CovCoveragePatternStyler >> styleFrom: from to: to with: attributes [
	(source from: from to: to) attributes: attributes
]

{ #category : #visiting }
CovCoveragePatternStyler >> styleValueNode: aNode [
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
CovCoveragePatternStyler >> visitArgumentNode: aNode [
	super visitArgumentNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
CovCoveragePatternStyler >> visitMethodNode: aNode [
	super visitMethodNode: aNode.
	self styleValueNode: aNode
]
