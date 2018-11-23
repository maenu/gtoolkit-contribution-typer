Class {
	#name : #CovCoveragePatternStyler,
	#superclass : #Object,
	#instVars : [
		'source'
	],
	#category : #'Coverage-GToolkit'
}

{ #category : #'as yet unclassified' }
CovCoveragePatternStyler >> extraStyle: aText ast: ast [
	
]

{ #category : #'as yet unclassified' }
CovCoveragePatternStyler >> style: aText ast: ast [
	source := aText.
	self visitMethodNode: ast
]

{ #category : #visiting }
CovCoveragePatternStyler >> styleFrom: from to: to with: attributes [
	(source from: from to: to) attributes: attributes
]

{ #category : #visiting }
CovCoveragePatternStyler >> styleValueNode: aNode with: aSummary [
	self
		styleFrom: aNode stop
		to: aNode stop
		with:
			{(CovSummaryClassAttribute new
				summary: aSummary;
				yourself).
			(CovSummarySizeAttribute new
				summary: aSummary;
				yourself).
			(CovSummaryExpandButtonAttribute new
				summary: aSummary;
				yourself)}
]

{ #category : #visiting }
CovCoveragePatternStyler >> visitArgumentNode: aNode [
	self
		styleValueNode: aNode
		with:
			([ aNode covClasses ]
				on: Error
				do: [ Halt now ])
]

{ #category : #visiting }
CovCoveragePatternStyler >> visitMethodNode: aNode [
	aNode arguments do: [ :e | self visitArgumentNode: e ].
	self
		styleValueNode: aNode
		with:
			([ aNode covClassesForResult ]
				on: Error
				do: [ Halt now ])
]
