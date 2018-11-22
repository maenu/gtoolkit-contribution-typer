Class {
	#name : #CovCoverageBodyStyler,
	#superclass : #GtCoderBodyStyler,
	#traits : 'TRBProgramNodeVisitor',
	#classTraits : 'TRBProgramNodeVisitor classTrait',
	#category : #'Coverage-GToolkit'
}

{ #category : #visiting }
CovCoverageBodyStyler >> visitAssignmentNode: aNode [
	CovCoverage
		installedNodeFor: aNode
		ifFound: [ :e | 
			self
				styleFrom: aNode variable stop
				to: aNode variable stop
				with:
					{(CovClassAttribute new
						class_: e variable covClass;
						yourself).
					(CovSummarySizeAttribute new
						summary: e covAssigns;
						yourself).
					(CovSummaryExpandButtonAttribute new
						summary: e covAssigns;
						yourself)} ]
		ifNone: [  ].
	^ super visitAssignmentNode: aNode
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitMessageNode: aNode [
	CovCoverage
		installedNodeFor: aNode
		ifFound: [ :e | 
			self
				styleFrom: (aNode keywordsPositions at: 1) - 1
				to: (aNode keywordsPositions at: 1) - 1
				with:
					{(CovSummarySizeAttribute new
						summary: e covSends;
						yourself).
					(CovSummaryExpandButtonAttribute new
						summary: e covSends;
						yourself)} ]
		ifNone: [  ].
	^ super visitMessageNode: aNode
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitMethodNode: aNode [
	CovCoverage
		installedNodeFor: aNode
		ifFound: [ :e | 
			self
				styleFrom: patternSource size + 2
				to: patternSource size + 2
				with:
					{(CovSummarySizeAttribute new
						summary: e covInvocations;
						yourself).
					(CovSummaryExpandButtonAttribute new
						summary: e covInvocations;
						yourself)} ]
		ifNone: [ ].
	^ super visitMethodNode: aNode
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitReturnNode: aNode [
	CovCoverage
		installedNodeFor: aNode
		ifFound: [ :e | 
			self
				styleFrom: aNode value stop
				to: aNode value stop
				with:
					{(CovSummarySizeAttribute new
						summary: e covReturns;
						yourself).
					(CovSummaryExpandButtonAttribute new
						summary: e covReturns;
						yourself)} ]
		ifNone: [  ].
	^ super visitReturnNode: aNode
]
