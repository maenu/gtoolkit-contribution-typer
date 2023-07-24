Extension { #name : #SmaCCToken }

{ #category : #'*Typer-Shadow-SmaCC' }
SmaCCToken >> typShaMethodStopPosition: aLookup [
	<typShaMethod: 'stopPosition'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType asNullable
]

{ #category : #'*Typer-Shadow-SmaCC' }
SmaCCToken >> typShaMethodValue: aLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
