Extension { #name : #TypTyping }

{ #category : #'*Typer-Inference' }
TypTyping >> typInfRunAllMethods [
	<gtExample>
	^ CompiledMethod allInstances collect: [ :m | m typInfRun: 5 seconds ]
]

{ #category : #'*Typer-Inference' }
TypTyping >> typInfRunAndMonitorAllMethods [
	<gtExample>
	^ CompiledMethod allInstances
		collect: [ :m | m typInfRunAndMonitor: 5 seconds ]
]

{ #category : #'*Typer-Inference' }
TypTyping >> typInfRunAndMonitorSomeMethods [
	<gtExample>
	^ self typInfSomeMethods collect: [ :m | m typInfRunAndMonitor: 30 seconds ]
]

{ #category : #'*Typer-Inference' }
TypTyping >> typInfRunSomeMethods [
	<gtExample>
	^ self typInfSomeMethods collect: [ :m | m typInfRun: 30 seconds ]
]

{ #category : #'*Typer-Inference' }
TypTyping >> typInfSomeMethods [
	| all methods |
	all := CompiledMethod allInstances.
	methods := IdentitySet new.
	[ methods size < 3 ] whileTrue: [ methods add: all atRandom ].
	^ methods
]
