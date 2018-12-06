Trait {
	#name : #TTypGtCoderMethodsFilter,
	#category : #'Typer-GToolkit-Filter'
}

{ #category : #'logical operations' }
TTypGtCoderMethodsFilter >> & aFilter [
	^ TypGtCoderIntersectionFilter forFilter: self filter: aFilter
]

{ #category : #converting }
TTypGtCoderMethodsFilter >> asCollection [
	^ TypGtCoderMethodsCollection forFilter: self
]

{ #category : #'logical operations' }
TTypGtCoderMethodsFilter >> not [
	^ TypGtCoderNegationFilter new originalFilter: self
]

{ #category : #'logical operations' }
TTypGtCoderMethodsFilter >> | aFilter [
	^ TypGtCoderUnionFilter forFilter: self filter: aFilter
]
