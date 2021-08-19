Extension { #name : #ClassVariable }

{ #category : #'*Typer-GToolkit' }
ClassVariable >> typGtCanType [

	<typPraResult: 'Boolean'>
	^ true
]

{ #category : #'*Typer-GToolkit' }
ClassVariable >> typGtFiltersToTypeWithPragma [

	<typPraResult: 'GtCoderMethodsFilter'>
	self assert: [ self typGtCanType ].
	^ (GtSearchImplementorsFilter selector: #initialize)
	  & (TypGtCoderTypeFilter new
			   type: definingClass typAsType;
			   yourself) & (TypGtCoderDefinerFilter new
		   name: name;
		   yourself)
]

{ #category : #'*Typer-GToolkit' }
ClassVariable >> typGtShadowMethod [

	| shadow |
	self assert: [ self typGtCanType ].
	shadow := (TypShaShadow typGtShadowFor: definingClass)
		          ifEmpty: [ TypShaShadow typGtNewShadowFor: definingClass ]
		          ifNotEmpty: #first.
	^ shadow
		  typGtShadowVariable: name asSymbol
		  type: value typInfSelfType
		  in: shadow class
]
