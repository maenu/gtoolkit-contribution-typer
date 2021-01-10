Class {
	#name : #TypGtCoverageAstStyler,
	#superclass : #GtASTStyler,
	#category : #'Typer-GToolkit-Typer-GToolkit'
}

{ #category : #accessing }
TypGtCoverageAstStyler >> visitNode: aNode [
	super visitNode: aNode.
	aNode
		propertyAt: #typCoverage
		ifPresent: [ :c | 
			self
				styleFrom: aNode start
				to: aNode stop
				with:
					{(BlTextUnderlineAttribute new
						color:
							(c
								ifTrue: [ Color green ]
								ifFalse: [ Color red ]);
						yourself)} ]
]
