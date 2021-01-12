Class {
	#name : #TypGtCoverageAstStyler,
	#superclass : #GtASTStyler,
	#category : #'Typer-GToolkit-Typer-GToolkit'
}

{ #category : #accessing }
TypGtCoverageAstStyler >> styleNode: aNode [
	<typTypeArgument: 1 as: '{RBMethodNode,RBMessageNode}'>
	<typTypeArgument: 2 as: 'Color'>
	aNode
		propertyAt: #tagExecuted
		ifPresent: [ :c | 
			aNode keywordsIntervals
				do: [ :e | 
					self
						styleFrom: e first
						to: e last
						with:
							{(BlTextBackgroundAttribute new
								paint:
									((c
										ifTrue: [ Color green ]
										ifFalse: [ Color red ]) alpha: 0.5) asBlPaint;
								yourself)} ] ]
		ifAbsent: [  ]
]

{ #category : #accessing }
TypGtCoverageAstStyler >> visitMessageNode: aNode [
	super visitMessageNode: aNode.
	self styleNode: aNode
]

{ #category : #accessing }
TypGtCoverageAstStyler >> visitMethodNode: aNode [
	super visitMethodNode: aNode.
	self styleNode: aNode
]
