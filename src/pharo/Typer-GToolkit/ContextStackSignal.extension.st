Extension { #name : #ContextStackSignal }

{ #category : #'*Typer-GToolkit' }
ContextStackSignal >> typGtStack [
	| contexts |
	contexts := OrderedCollection new.
	self stack
		do: [ :c | 
			| m |
			m := c compiledCode.
			(m isCompiledMethod
				and: [ m package isNotNil
						and: [ (m package name beginsWith: 'Typer')
								and: [ contexts isEmpty or: [ contexts last compiledCode ~~ m ] ] ] ])
				ifTrue: [ contexts add: c ] ].
	^ contexts
]
