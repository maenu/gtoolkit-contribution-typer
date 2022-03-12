Trait {
	#name : #TTypAssertable,
	#category : #'Typer-Core-Examples-Initializing'
}

{ #category : #accessing }
TTypAssertable >> assert: aBlock signals: aClass [
	| signaled |
	signaled := false.
	aBlock
		on: aClass
		do: [ signaled := true ].
	self assert: signaled
]
