Class {
	#name : #CovCoverageBodyStyler,
	#superclass : #GtCoderBodyStyler,
	#traits : 'TRBProgramNodeVisitor',
	#classTraits : 'TRBProgramNodeVisitor classTrait',
	#category : #'Coverage-GToolkit'
}

{ #category : #visiting }
CovCoverageBodyStyler >> visitAssignmentNode: aNode [
	self
		styleFrom: aNode start - 1
		to: aNode start - 1
		with:
			{(BrTextAdornmentDynamicAttribute new
				beAppend;
				stencil: [ (CovCoverage covAssignsIn: aNode methodNode method for: aNode) size asRopedText ])}.
	^ super visitAssignmentNode: aNode
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitMessageNode: aNode [
	| sends |
	sends := CovCoverage covSendsIn: aNode methodNode method for: aNode.
	self
		styleFrom: aNode stop
		to: aNode stop
		with:
			{(BrTextAdornmentDynamicAttribute new
				beAppend;
				stencil: [ sends size asRopedText
						foreground: Color veryLightGray;
						fontSize: 6 ]).
			(BrTextExpandButtonAttribute new
				attributesCreatingBlock: [ {(BrTextAdornmentDynamicAttribute new
						beAppend;
						stencil: [ | editorElement |
							editorElement := GtInspector new.
							editorElement
								constraintsDo: [ :c | 
									c horizontal matchParent.
									c vertical matchParent ].
							editorElement size: 600 @ 300.
							editorElement spawnInitial: sends.
							editorElement border: (BlBorder paint: Color veryLightGray width: 1).
							editorElement
								margin:
									(BlInsets
										top: 0
										right: 10
										bottom: 10
										left: 10) ])} ])}.
	^ super visitMessageNode: aNode
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitMethodNode: aNode [
	self
		styleFrom: aNode stop
		to: aNode stop
		with:
			{(BrTextAdornmentDynamicAttribute new
				beAppend;
				stencil: [ (CovCoverage covInvocationsIn: aNode methodNode method for: aNode methodNode) size asRopedText ])}.
	^ super visitMethodNode: aNode
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitReturnNode: aNode [
	self
		styleFrom: aNode start - 1
		to: aNode start - 1
		with:
			{(BrTextAdornmentDynamicAttribute new
				beAppend;
				stencil: [ (CovCoverage covReturnsIn: aNode methodNode method for: aNode) size asRopedText ])}.
	^ super visitReturnNode: aNode
]
