Extension { #name : #SmaCCToken }

{ #category : #'*Typer-Shadow-SmaCC' }
SmaCCToken >> typShaMethodUnaryStopPosition: aLookup [
	<typShaMethod: 'stopPosition'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType asNullable
]

{ #category : #'*Typer-Shadow-SmaCC' }
SmaCCToken >> typShaMethodUnaryValue: aLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
