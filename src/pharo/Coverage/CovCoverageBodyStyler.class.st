Class {
	#name : #CovCoverageBodyStyler,
	#superclass : #GtCoderBodyStyler,
	#traits : 'TRBProgramNodeVisitor',
	#classTraits : 'TRBProgramNodeVisitor classTrait',
	#category : #'Coverage-GToolkit'
}

{ #category : #'instance creation' }
CovCoverageBodyStyler >> newCoverageLabelFor: aText [
	^ BrLabel new
		text: aText;
		look:
			(BrGlamorousLabelLook new
				foreground: Color veryLightGray;
				fontSize: 10)
]

{ #category : #visiting }
CovCoverageBodyStyler >> visitAssignmentNode: aNode [
	self
		styleFrom: aNode start - 1
		to: aNode start - 1
		with:
			{(BrTextAdornmentDynamicAttribute new
				beAppend;
				stencil: [ self newCoverageLabelFor: (CovCoverage covAssignsIn: aNode methodNode method for: aNode) size asString ])}.
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
				stencil: [ self newCoverageLabelFor: sends size asString ]).
			(BrTextExpandButtonAttribute new
				attributesCreatingBlock: [ {(BrTextAdornmentDynamicAttribute new
						beAppend;
						stencil: [
							| aContainer anObjectView |
							
							aContainer := BlElement new.
							aContainer
								look: BrShadowLook new;
								layout: BlLinearLayout vertical;
								margin: (BlInsets all: 20);
								background: Color white;
								constraintsDo: [ :c | 
									c textFlow pushLine.
									c horizontal matchParent.
									c vertical exact: 200 ].
							
							anObjectView := sends gtViewsFor: GtPhlowView empty.
							anObjectView asElementDo: [ :aViewElement | aContainer addChild: aViewElement ].
							
							aContainer ])} ])}.
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
				stencil: [ self newCoverageLabelFor: (CovCoverage covInvocationsIn: aNode methodNode method for: aNode methodNode) size asString ])}.
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
				stencil: [ self newCoverageLabelFor:  (CovCoverage covReturnsIn: aNode methodNode method for: aNode) size asString ])}.
	^ super visitReturnNode: aNode
]
