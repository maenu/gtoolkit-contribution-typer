Extension { #name : #SmaCCToken }

{ #category : #'*Typer-Shadow-SmaCC' }
SmaCCToken >> typShaMethodUnaryStopPosition: aLookup root: anotherLookup [
	<typShaMethod: 'stopPosition'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType asNullable
]

{ #category : #'*Typer-Shadow-SmaCC' }
SmaCCToken >> typShaMethodUnaryValue: aLookup root: anotherLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
