Extension { #name : #MethodStackSignal }

{ #category : #'*Typer-GToolkit' }
MethodStackSignal >> typGtStack [
	| methods |
	methods := OrderedCollection new.
	self stack
		collect: #compiledMethod
		thenDo: [ :m | 
			(m isNotNil
				and: [ (m package name beginsWith: 'Typer-Inference')
						and: [ methods isEmpty or: [ methods last ~~ m ] ] ])
				ifTrue: [ methods add: m ] ].
	^ methods
]
