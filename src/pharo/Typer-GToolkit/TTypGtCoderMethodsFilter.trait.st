Trait {
	#name : #TTypGtCoderMethodsFilter,
	#category : #'Typer-GToolkit-Filter'
}

{ #category : #'logical operations' }
TTypGtCoderMethodsFilter >> & aFilter [
	<typTypeArgument: 1 as: 'GtCoderMethodsFilter'>
	<typTypeResultAs: 'TypGtCoderIntersectionFilter'>
	^ TypGtCoderIntersectionFilter forFilter: self filter: aFilter
]

{ #category : #converting }
TTypGtCoderMethodsFilter >> asCollection [
	<typTypeResultAs: 'TypGtCoderMethodsCollection'>
	^ TypGtCoderMethodsCollection forFilter: self
]

{ #category : #'logical operations' }
TTypGtCoderMethodsFilter >> not [
	<typTypeArgument: 1 as: 'GtCoderMethodsFilter'>
	<typTypeResultAs: 'TypGtCoderNegationFilter'>
	^ TypGtCoderNegationFilter new originalFilter: self
]

{ #category : #'logical operations' }
TTypGtCoderMethodsFilter >> | aFilter [
	<typTypeArgument: 1 as: 'GtCoderMethodsFilter'>
	<typTypeResultAs: 'TypGtCoderUnionFilter'>
	^ TypGtCoderUnionFilter forFilter: self filter: aFilter
]
