Class {
	#name : #TypGtCoverageAstStyler,
	#superclass : #GtRBASTStyler,
	#category : #'Typer-GToolkit-Typer-GToolkit'
}

{ #category : #accessing }
TypGtCoverageAstStyler >> styleNode: aNode [
	<typPraArguments: 'RBProgramNode'>
	aNode
		propertyAt: #tagExecuted
		ifPresent: [ :c | 
			self
				styleFrom: aNode start
				to: aNode stop
				with:
					{(BlTextBackgroundAttribute new
						paint:
							((c
								ifTrue: [ Color green ]
								ifFalse: [ Color red ]) alpha: 0.3) asBlPaint;
						yourself)} ]
		ifAbsent: [  ]
]

{ #category : #accessing }
TypGtCoverageAstStyler >> visitNode: aNode [
	self styleNode: aNode.
	super visitNode: aNode
]
